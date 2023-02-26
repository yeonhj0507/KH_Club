package foodData;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/foodCtrl")
public class foodCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public foodCtrl() {
        super();
    }

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDate now = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
        String dt = now.format(formatter);
        
        BufferedReader br = null;
        
        try{            
            String urlstr = "https://open.neis.go.kr/hub/mealServiceDietInfo?key=16c6ed183ccf402dbff0d174ff8a04d7&Type=jsonp&Index=1&pSize=100&ATPT_OFCDC_SC_CODE=B10&SD_SCHUL_CODE=7010126&MLSV_YMD="+dt;
            URL url = new URL(urlstr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String result = "";
            String line;
            while((line = br.readLine()) != null) {
                result = result + line + "\n";
            }
            JSONObject objData = (JSONObject)new JSONParser().parse(result);
            JSONArray arrData = (JSONArray)objData.get("mealServiceDietInfo");
            JSONObject row = (JSONObject)arrData.get(1);
            arrData = (JSONArray)row.get("row");
            
            String[] food = new String[arrData.size()];
            String[] date = new String[arrData.size()];
            String todayFood = null;
            
            for (int i = 0; i<arrData.size(); i++) {
            	JSONObject temp = (JSONObject)arrData.get(i);
            	if((boolean)temp.get("MMEAL_SC_NM").equals("중식")) {

                	food[i] = (String)temp.get("DDISH_NM");
                	date[i] = (String)temp.get("MLSV_YMD");
                	formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
                	if(date[i].equals(now.format(formatter))) {
                		todayFood = food[i];
                	}
            	}
            }
            
            LocalDate firstDate = LocalDate.parse(date[0], DateTimeFormatter.ofPattern("yyyyMMdd"));
            DayOfWeek dayOfWeek = firstDate.getDayOfWeek();
            int dayOfWeekNumber = dayOfWeek.getValue();
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            String userID = (String)session.getAttribute("userID");
            

            if(userID!=null) {
            	request.setAttribute("userID", userID);
            }
            
            if (action==null || action.equals("login")) {
                if(todayFood == null) {
                	request.setAttribute("food", "오늘은 급식이 없습니다.");
                } else {
            		request.setAttribute("food", todayFood);
                }
                
            	request.setAttribute("userID", userID);
            	RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp");
            	dispatcher.forward(request, response);
            	
            } else if( action.equals("monthly")) {
            	request.setAttribute("date", dayOfWeekNumber-1);
            	request.setAttribute("date1", 6-dayOfWeekNumber);
            	request.setAttribute("food", food);
         
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/foodPage/food.jsp");
            	dispatcher.forward(request, response);
            }
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
	}
}
