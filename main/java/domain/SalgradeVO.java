package domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class SalgradeVO {
	
	
	
	
	
	private int grade;
	private int losal;
	private int hisal;
	private int cnt;
	
	
	@Override
	public String toString() {
		return String.format("%d 등급 ( %d~%d ) - %d명\n", grade, losal, hisal, cnt);
	}
	
}
