package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import lib.ConnectDbLib;

public abstract class AbstractDAO {
	protected ConnectDbLib dbAccess;
	protected PreparedStatement preparedStatement;
	protected ResultSet resultSet;
	protected Connection connection;
	
}
