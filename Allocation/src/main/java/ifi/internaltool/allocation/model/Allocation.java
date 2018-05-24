package ifi.internaltool.allocation.model;

import java.util.UUID;
import java.time.LocalDate;

import org.springframework.data.cassandra.core.cql.PrimaryKeyType;
import org.springframework.data.cassandra.core.mapping.Column;
import org.springframework.data.cassandra.core.mapping.PrimaryKeyColumn;
import org.springframework.data.cassandra.core.mapping.Table;

@Table
public class Allocation {
	@Column("id")
	private UUID id;
	@PrimaryKeyColumn(name = "user_id", type = PrimaryKeyType.PARTITIONED)
	private UUID user_id;
	@PrimaryKeyColumn(name = "project_id", type = PrimaryKeyType.PARTITIONED)
	private UUID project_id;
	
	@PrimaryKeyColumn(name = "month", type = PrimaryKeyType.CLUSTERED)
	private int month;
	@PrimaryKeyColumn(name = "status", type = PrimaryKeyType.CLUSTERED)
	private boolean status;
	@Column("completed")
	private float completed;
	@Column("expect")
	private float expect;
	
	@Column("create_at")
	private LocalDate create_at;
	@Column("end_at")
	private LocalDate end_at;
	
	public Allocation() {
		
	}
	public Allocation(final UUID user_id,final UUID project_id, final int month, 
			final boolean status,final float completed, final float expect,
			final LocalDate create_at,final LocalDate end_at) {
		this.user_id= user_id;
		this.project_id=project_id;
		this.month=month;
		this.status=status;
		this.completed=completed;
		this.expect=expect;
		this.create_at=create_at;
		this.end_at= end_at;
	}
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getUser_id() {
		return user_id;
	}
	public void setUser_id(UUID user_id) {
		this.user_id = user_id;
	}
	public UUID getProject_id() {
		return project_id;
	}
	public void setProject_id(UUID project_id) {
		this.project_id = project_id;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public float getCompleted() {
		return completed;
	}
	public void setCompleted(float completed) {
		this.completed = completed;
	}
	public float getExpect() {
		return expect;
	}
	public void setExpect(float expert) {
		this.expect = expert;
	}
	public LocalDate getCreate_at() {
		return create_at;
	}
	public void setCreate_at(LocalDate create_at) {
		this.create_at = create_at;
	}
	public LocalDate getEnd_at() {
		return end_at;
	}
	public void setEnd_at(LocalDate end_at) {
		this.end_at = end_at;
	}
	
}
