package fabricas.presentacion.controladores;
 
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BaseController {


	private static final String REGISTRO = "registro";
	private static final String INDEX = "indexAlojamiento";
	private static final String VIDEO = "video";

	private int port = 22001;
	private String ip = "192.168.0.14";
	
	@RequestMapping(value="/")
	public ModelAndView inicio(){
		return new ModelAndView("redirect:/registro");
	}
	
	/**
	 * Controlador de la pantalla de Registro
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registrarse(ModelMap model) {
		ModelAndView modelAndView = new ModelAndView(REGISTRO);
		modelAndView.addObject("usuarioAutenticado",utilidades.getSessionUser());
		return modelAndView;
	}
	
	
	@RequestMapping(value="/video", method = RequestMethod.POST)
	public ModelAndView autenticarYRegistrar(
		@RequestParam(value="email", required=true) String email, 
		@RequestParam(value="password", required=true) String password,
		@RequestParam(value="name", required=false) String name) throws UnknownHostException, IOException{
		
		Socket clientSocket = new Socket(ip, port);
		DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream());
		BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
		
		String response = "";
		//Registro
		if(name != null){			
			outToServer.writeBytes("Registro:"+email+","+password+","+name+".");
//			modifiedSentence = inFromServer.readLine();
//			System.out.println("FROM SERVER: " + modifiedSentence);
			response = "Te has registrado con éxito. Bienvenido";
		}

		//Autenticar
		else{
			String str = "Auth:"+email+","+password+".";
			outToServer.writeBytes(str);
			String input = inFromServer.readLine();
			System.out.println(input);
			
			if(input.equals("Encontrado")){
				ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
				HttpSession session = attr.getRequest().getSession(true);
				session.setAttribute("user", email);
				response = "Te has autenticado con éxito";
			}
		}
		
		clientSocket.close();
	
		ModelAndView modelAndView = new ModelAndView(VIDEO);
		modelAndView.addObject("response", response);
		modelAndView.addObject("usuarioAutenticado",utilidades.getSessionUser());
		return modelAndView;
	}
	
	@RequestMapping(value="/subir", method = RequestMethod.POST)
	public ModelAndView cargaVideo(
		@RequestParam(value="datafile", required=true) MultipartFile file){

		String response = "Vamos bien"; 
		try{
			byte[] bytes = file.getBytes();

//			Socket clientSocket = new Socket(ip, port);
//			DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream());
//			BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
			
//			BufferedOutputStream stream = new BufferedOutputStream(
//					new FileOutputStream(serverFile));

//			stream.write(bytes);
//			stream.close();
//
//			response = "You successfully uploaded file=" + file.getName();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		ModelAndView modelAndView = new ModelAndView(VIDEO);
		modelAndView.addObject("usuarioAutenticado",utilidades.getSessionUser());
		return modelAndView;
	}
	
	
//	@RequestMapping(value = "/streaming", method = RequestMethod.GET)
//	public void recibirFrames() throws UnknownHostException
//	{
//        InetAddress dirIP = InetAddress.getByName(ip);
//        byte[] buffer = new byte[10000];
//        byte[] bytes = null;
//        
//        while(true)
//        {
//		try{
//			System.out.println("Estamos entrando");
//			DatagramSocket socket = new DatagramSocket(port);
//			DatagramPacket paquete = new DatagramPacket(buffer, buffer.length);
//			socket.receive(paquete);
//			bytes = paquete.getData();
//			
//			socket.close();
//			
//			try{
//				BufferedImage img = ImageIO.read(new ByteArrayInputStream(bytes));
//				System.out.println(img);
//			}
//			catch(IOException e2){
//				e2.printStackTrace();
//			}
//		}
//		catch(IOException e){
//			e.printStackTrace();
//		}
//		
//        }
//		
//	}
	
	@RequestMapping(value="/salir")
	public ModelAndView cerrarSesion(){
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession(true);
		session.invalidate();
		ModelAndView modelAndView = new ModelAndView(VIDEO);
		modelAndView.addObject("usuarioAutenticado",utilidades.getSessionUser());
		return modelAndView;
	}

	
	
}