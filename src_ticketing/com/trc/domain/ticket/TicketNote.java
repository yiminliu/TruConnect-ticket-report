package com.trc.domain.ticket;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Repository;

import com.trc.user.User;

@Entity
@Table(name="ticket_note")
public class TicketNote implements Serializable {
  private static final long serialVersionUID = 2820727502811757522L;
  
  @Id
  @Column(name="ticket_note_id")
  @GeneratedValue(strategy = GenerationType.AUTO)
  private int id;  
    
  @Column(name="note", nullable = true, insertable = true, updatable = true)
  private String note;
     
  @Column(name = "created_date", updatable = false)
  @Temporal(TemporalType.TIMESTAMP)
  //@Generated(GenerationTime.ALWAYS)
  Date createdDate;
  
  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name="author_id", insertable = true, updatable = true)
  private User author;
  
  @ManyToOne(targetEntity = Ticket.class)
  @JoinColumn(name="ticket_id", nullable = false, insertable = true, updatable = true)
  private Ticket ticket;
  
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }
  
  public User getAuthor() {
    return author;
  }
  
  public void setAuthor(User author) {
    this.author = author;
  }

  public String getNote() {
    return note;
  }

  public void setNote(String note) {
    this.note = note;
  }

  public Date getCreatedDate() {
	return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
  }
	
  public Ticket getTicket() {
	 return ticket;
  }

  public void setTicket(Ticket ticket) {
	 this.ticket = ticket;
  }
	
  @Override
  public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((author == null) ? 0 : author.hashCode());
	result = prime * result + id;
	result = prime * result + ((ticket == null) ? 0 : ticket.hashCode());
	return result;
  }

  @Override
  public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	TicketNote other = (TicketNote) obj;
	if (id != other.id)
		return false;
	if (note == null) {
		if (other.note != null)
			return false;
	} else if (!note.equals(other.note))
		return false;
	if (ticket == null) {
		if (other.ticket != null)
			return false;
	} else if (!ticket.equals(other.ticket))
		return false;
	return true;
}

@Override
  public String toString() {
  	return "TicketNote [ticketNoteId=" + id + ", note=" + note + "]";
  }
}
