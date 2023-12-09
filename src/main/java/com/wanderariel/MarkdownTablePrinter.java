package com.wanderariel;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Hello world.
 *
 */
public class MarkdownTablePrinter {
  private List<String[]> rowsList;
  private String fileName;

  /**
   * Constructor that takes a 2D array of strings and a file name.
   */
  public MarkdownTablePrinter(String[][] rows, String fileName) {
    this.rowsList = new ArrayList<String[]>();
    this.fileName = fileName;
    for (String[] row : rows) {
      this.rowsList.add(row);
    }
  }

  public MarkdownTablePrinter(List<String[]> rows, String fileName) {
    this.rowsList = rows;
    this.fileName = fileName;
  }

  /**
   * Main method that writes a markdown table to a file.
   */
  public void print() {
    try {
      writeMarkdownTableToFile(fileName, this.rowsList);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private static void writeMarkdownTableToFile(String fileName, List<String[]> rows) 
      throws IOException {
    try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
      int[] columnWidths = getColumnWidths(rows);
      writeRow(writer, rows.get(0), columnWidths, true);
      for (int i = 1; i < rows.size(); i++) {
        writeRow(writer, rows.get(i), columnWidths, false);
      }
    }
  }

  private static int[] getColumnWidths(List<String[]> rows) {
    int numColumns = rows.get(0).length;
    int[] widths = new int[numColumns];

    for (String[] row : rows) {
      for (int i = 0; i < row.length; i++) {
        widths[i] = Math.max(widths[i], row[i].length());
      }
    }
    return widths;
  }

  private static void 
      writeRow(BufferedWriter writer, String[] row, int[] columnWidths, boolean isHeader) 
      throws IOException {
    writer.write("|");
    for (int i = 0; i < row.length; i++) {
      writer.write(String.format(" %-" + columnWidths[i] + "s |", row[i]));
    }
    writer.newLine();
    if (isHeader) {
      writer.write("|");
      for (int width : columnWidths) {
        writer.write(String.join("", " ", repeat('-', width), " |"));
      }
      writer.newLine();
    }
  }

  // Custom repeat method for older Java versions
  private static String repeat(char ch, int times) {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < times; i++) {
      sb.append(ch);
    }
    return sb.toString();
  }
}
