package SD.project.member;

public class MemberDto {

	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	
	public MemberDto(){
		
	}
	
	public String getId(){
		return id;
	}
	
	public void setId(String id){
		this.id = id;
	}
	
	public String getPw(){
		return pw;
	}
	
	public void setPw(String Pw){
		this.pw = Pw;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String Name){
		this.name = Name;
	}
	
	public String getTel(){
		return tel;
	}
	
	public void setTel(String Tel){
		this.tel = Tel;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String Email){
		this.email = Email;
	}
}
