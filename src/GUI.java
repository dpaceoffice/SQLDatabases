import javax.swing.JList;
import javax.swing.SwingUtilities;

import project.Database;

/**
 *
 * @author David
 */
public class GUI extends javax.swing.JFrame {

    /**
     * Creates new form GUI
     */
    public GUI() {
        Database db = Database.getInstance();
        db.init();
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc="Generated Code">                          
    private void initComponents() {

        listPopupMenu = new javax.swing.JPopupMenu();
        modifyOption = new javax.swing.JMenuItem();
        deleteOption = new javax.swing.JMenuItem();
        TabSeperator = new javax.swing.JTabbedPane();
        PersonPanel = new javax.swing.JPanel();
        personScrollPane = new javax.swing.JScrollPane();
        personList = new javax.swing.JList<>();
        insertPersonButton = new javax.swing.JButton();
        fNameLabel = new javax.swing.JLabel();
        firstNameField = new javax.swing.JTextField();
        lNameLabel = new javax.swing.JLabel();
        lastNameField = new javax.swing.JTextField();
        emailLabel = new javax.swing.JLabel();
        emailField = new javax.swing.JTextField();
        maleRadioButton = new javax.swing.JRadioButton();
        femaleRadioButton = new javax.swing.JRadioButton();
        emailLabel1 = new javax.swing.JLabel();
        phoneField = new javax.swing.JTextField();
        JobPanel = new javax.swing.JPanel();
        jobScrollPane = new javax.swing.JScrollPane();
        jobList = new javax.swing.JList<>();
        insertJobButton = new javax.swing.JButton();
        jobIDLabel = new javax.swing.JLabel();
        jobIDField = new javax.swing.JTextField();
        positionIdLabel = new javax.swing.JLabel();
        positionIDField = new javax.swing.JTextField();
        employeeLabel = new javax.swing.JLabel();
        wageRadioButton = new javax.swing.JRadioButton();
        salaryRadioButton = new javax.swing.JRadioButton();
        payRateLabel = new javax.swing.JLabel();
        payRateField = new javax.swing.JTextField();
        SkillPanel = new javax.swing.JPanel();
        skillScrollPane = new javax.swing.JScrollPane();
        skillList = new javax.swing.JList<>();
        insertSkillButton = new javax.swing.JButton();
        skillTitleLabel = new javax.swing.JLabel();
        skillTitleField = new javax.swing.JTextField();
        descLabel = new javax.swing.JLabel();
        descField = new javax.swing.JTextField();
        levelLabel = new javax.swing.JLabel();
        levelField = new javax.swing.JTextField();

        listPopupMenu.setLabel("popupOptions");
        listPopupMenu.setPopupSize(new java.awt.Dimension(95, 50));

        modifyOption.setText("modify");
        modifyOption.setBorderPainted(true);
        modifyOption.setMinimumSize(new java.awt.Dimension(10, 10));
        modifyOption.setName("modifyOption"); // NOI18N
        modifyOption.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                modifyOptionActionPerformed(evt);
            }
        });
        listPopupMenu.add(modifyOption);

        deleteOption.setText("delete");
        deleteOption.setBorderPainted(true);
        deleteOption.setMinimumSize(new java.awt.Dimension(50, 50));
        deleteOption.setName("deleteOption"); // NOI18N
        deleteOption.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteOptionActionPerformed(evt);
            }
        });
        listPopupMenu.add(deleteOption);
        setTitle("Helper GUI");
        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(100, 0));

        PersonPanel.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        
        Database db = Database.getInstance();
        Object[] persons = db.getLoaded_persons().entrySet().toArray();
        String[] strings = new String[persons.length];
        for(int i = 0; i < persons.length; i ++) {
            strings[i] = persons[i].toString().split("=")[1];
        }
        personList.setModel(new javax.swing.AbstractListModel<String>() {
            public int getSize() { return strings.length; }
            public String getElementAt(int i) { return strings[i]; }
        });
        personList.setComponentPopupMenu(listPopupMenu);
        personList.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        personList.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                personListMousePressed(evt);
            }
        });
        personScrollPane.setViewportView(personList);

        insertPersonButton.setText("Insert Person");

        fNameLabel.setText("First Name:");

        lNameLabel.setText("Last Name:");

        emailLabel.setText("Email Address:");

        emailField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                emailFieldActionPerformed(evt);
            }
        });

        maleRadioButton.setText("Male");

        femaleRadioButton.setText("Female");

        emailLabel1.setText("Phone Number:");

        phoneField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                phoneFieldActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout PersonPanelLayout = new javax.swing.GroupLayout(PersonPanel);
        PersonPanel.setLayout(PersonPanelLayout);
        PersonPanelLayout.setHorizontalGroup(
            PersonPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PersonPanelLayout.createSequentialGroup()
                .addGap(2, 2, 2)
                .addComponent(personScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 407, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(PersonPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(PersonPanelLayout.createSequentialGroup()
                        .addGroup(PersonPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(firstNameField)
                            .addGroup(PersonPanelLayout.createSequentialGroup()
                                .addComponent(fNameLabel)
                                .addGap(0, 0, Short.MAX_VALUE)))
                        .addGap(10, 10, 10))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, PersonPanelLayout.createSequentialGroup()
                        .addGroup(PersonPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(emailField, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lastNameField))
                        .addContainerGap())
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, PersonPanelLayout.createSequentialGroup()
                        .addComponent(phoneField)
                        .addContainerGap())
                    .addGroup(PersonPanelLayout.createSequentialGroup()
                        .addGroup(PersonPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lNameLabel)
                            .addComponent(emailLabel)
                            .addGroup(PersonPanelLayout.createSequentialGroup()
                                .addComponent(maleRadioButton)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(femaleRadioButton))
                            .addComponent(emailLabel1)
                            .addComponent(insertPersonButton))
                        .addContainerGap(100, Short.MAX_VALUE))))
        );
        PersonPanelLayout.setVerticalGroup(
            PersonPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, PersonPanelLayout.createSequentialGroup()
                .addGroup(PersonPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(PersonPanelLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(fNameLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(firstNameField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lNameLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lastNameField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(emailLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(emailField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(emailLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(phoneField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addGroup(PersonPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(maleRadioButton)
                            .addComponent(femaleRadioButton))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 66, Short.MAX_VALUE)
                        .addComponent(insertPersonButton))
                    .addComponent(personScrollPane))
                .addContainerGap())
        );

        TabSeperator.addTab("Person List", PersonPanel);

        JobPanel.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        Object[] jobs = db.getLoaded_jobs().entrySet().toArray();
        String[] strings2 = new String[jobs.length];
        for(int i = 0; i < jobs.length; i ++) {
            strings2[i] = jobs[i].toString().split("=")[1];
        }
        jobList.setModel(new javax.swing.AbstractListModel<String>() {
            public int getSize() { return strings2.length; }
            public String getElementAt(int i) { return strings2[i]; }
        });
        jobList.setComponentPopupMenu(listPopupMenu);
        jobList.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jobList.setInheritsPopupMenu(true);
        jobList.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                jobListMousePressed(evt);
            }
        });
        jobScrollPane.setViewportView(jobList);

        insertJobButton.setText("Insert Job");
        insertJobButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                insertJobButtonActionPerformed(evt);
            }
        });

        jobIDLabel.setText("Job ID:");

        positionIdLabel.setText("Position Id:");

        employeeLabel.setText("Employee Mode:");

        wageRadioButton.setText("Wage");

        salaryRadioButton.setText("Salary");
        salaryRadioButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                salaryRadioButtonActionPerformed(evt);
            }
        });

        payRateLabel.setText("Pay Rate:");

        javax.swing.GroupLayout JobPanelLayout = new javax.swing.GroupLayout(JobPanel);
        JobPanel.setLayout(JobPanelLayout);
        JobPanelLayout.setHorizontalGroup(
            JobPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(JobPanelLayout.createSequentialGroup()
                .addGap(2, 2, 2)
                .addComponent(jobScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 407, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(JobPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(JobPanelLayout.createSequentialGroup()
                        .addGroup(JobPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jobIDField)
                            .addGroup(JobPanelLayout.createSequentialGroup()
                                .addComponent(jobIDLabel)
                                .addGap(0, 0, Short.MAX_VALUE)))
                        .addGap(10, 10, 10))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JobPanelLayout.createSequentialGroup()
                        .addComponent(positionIDField)
                        .addContainerGap())
                    .addGroup(JobPanelLayout.createSequentialGroup()
                        .addGroup(JobPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(positionIdLabel)
                            .addComponent(employeeLabel)
                            .addComponent(insertJobButton)
                            .addGroup(JobPanelLayout.createSequentialGroup()
                                .addComponent(wageRadioButton)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(salaryRadioButton))
                            .addComponent(payRateLabel)
                            .addComponent(payRateField))
                        .addContainerGap(94, Short.MAX_VALUE))))
        );
        JobPanelLayout.setVerticalGroup(
            JobPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JobPanelLayout.createSequentialGroup()
                .addGroup(JobPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(JobPanelLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jobIDLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jobIDField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(positionIdLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(positionIDField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(employeeLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(JobPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(wageRadioButton)
                            .addComponent(salaryRadioButton))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(payRateLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(payRateField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 112, Short.MAX_VALUE)
                        .addComponent(insertJobButton))
                    .addComponent(jobScrollPane))
                .addContainerGap())
        );

        TabSeperator.addTab("Job List", JobPanel);

        SkillPanel.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        Object[] skills = db.getLoaded_skills().entrySet().toArray();
        String[] strings3 = new String[skills.length];
        for(int i = 0; i < skills.length; i ++) {
            strings3[i] = skills[i].toString().split("=")[1];
        }
        skillList.setModel(new javax.swing.AbstractListModel<String>() {
            public int getSize() { return strings3.length; }
            public String getElementAt(int i) { return strings3[i]; }
        });
        skillList.setComponentPopupMenu(listPopupMenu);
        skillList.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                skillListMousePressed(evt);
            }
        });
        skillScrollPane.setViewportView(skillList);

        insertSkillButton.setText("Insert Skill");
        insertSkillButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                insertSkillButtonActionPerformed(evt);
            }
        });

        skillTitleLabel.setText("Title:");

        descLabel.setText("Description:");

        levelLabel.setText("Level\\Difficulty:");

        levelField.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                levelFieldActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout SkillPanelLayout = new javax.swing.GroupLayout(SkillPanel);
        SkillPanel.setLayout(SkillPanelLayout);
        SkillPanelLayout.setHorizontalGroup(
            SkillPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(SkillPanelLayout.createSequentialGroup()
                .addGap(2, 2, 2)
                .addComponent(skillScrollPane, javax.swing.GroupLayout.DEFAULT_SIZE, 407, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(SkillPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(SkillPanelLayout.createSequentialGroup()
                        .addGroup(SkillPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(skillTitleField)
                            .addGroup(SkillPanelLayout.createSequentialGroup()
                                .addComponent(skillTitleLabel)
                                .addGap(0, 0, Short.MAX_VALUE)))
                        .addGap(10, 10, 10))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, SkillPanelLayout.createSequentialGroup()
                        .addGroup(SkillPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(levelField, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(descField))
                        .addContainerGap())
                    .addGroup(SkillPanelLayout.createSequentialGroup()
                        .addGroup(SkillPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(descLabel)
                            .addComponent(levelLabel)
                            .addComponent(insertSkillButton))
                        .addContainerGap(123, Short.MAX_VALUE))))
        );
        SkillPanelLayout.setVerticalGroup(
            SkillPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, SkillPanelLayout.createSequentialGroup()
                .addGroup(SkillPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(SkillPanelLayout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(skillTitleLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(skillTitleField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(descLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(descField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(levelLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(levelField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 158, Short.MAX_VALUE)
                        .addComponent(insertSkillButton))
                    .addComponent(skillScrollPane))
                .addContainerGap())
        );

        TabSeperator.addTab("Skill List", SkillPanel);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(TabSeperator)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(TabSeperator)
        );

        pack();
    }// </editor-fold>                        

    private void emailFieldActionPerformed(java.awt.event.ActionEvent evt) {                                           
        // TODO add your handling code here:
    }                                          

    private void phoneFieldActionPerformed(java.awt.event.ActionEvent evt) {                                           
        // TODO add your handling code here:
    }                                          

    private void levelFieldActionPerformed(java.awt.event.ActionEvent evt) {                                           
        // TODO add your handling code here:
    }                                          

    private void insertSkillButtonActionPerformed(java.awt.event.ActionEvent evt) {                                                  
        // TODO add your handling code here:
    }                                                 

    private void insertJobButtonActionPerformed(java.awt.event.ActionEvent evt) {                                                
        // TODO add your handling code here:
    }                                               

    private void salaryRadioButtonActionPerformed(java.awt.event.ActionEvent evt) {                                                  
        // TODO add your handling code here:
    }                                                 

    private void modifyOptionActionPerformed(java.awt.event.ActionEvent evt) {                                             
        // TODO add your handling code here:
    }                                            

    private void personListMousePressed(java.awt.event.MouseEvent evt) {                                        
            if ( SwingUtilities.isRightMouseButton(evt) )
        {
            JList list = (JList)evt.getSource();
            int row = list.locationToIndex(evt.getPoint());
            list.setSelectedIndex(row);
        }
    }                                       

    private void jobListMousePressed(java.awt.event.MouseEvent evt) {                                     
            if ( SwingUtilities.isRightMouseButton(evt) )
        {
            JList list = (JList)evt.getSource();
            int row = list.locationToIndex(evt.getPoint());
            list.setSelectedIndex(row);
        }
    }                                    

    private void skillListMousePressed(java.awt.event.MouseEvent evt) {                                       
            if ( SwingUtilities.isRightMouseButton(evt) )
        {
            JList list = (JList)evt.getSource();
            int row = list.locationToIndex(evt.getPoint());
            list.setSelectedIndex(row);
        }
    }                                      

    private void deleteOptionActionPerformed(java.awt.event.ActionEvent evt) {                                             
        // TODO add your handling code here:
    }                                            

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GUI().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify                     
    private javax.swing.JPanel JobPanel;
    private javax.swing.JPanel PersonPanel;
    private javax.swing.JPanel SkillPanel;
    private javax.swing.JTabbedPane TabSeperator;
    private javax.swing.JMenuItem deleteOption;
    private javax.swing.JTextField descField;
    private javax.swing.JLabel descLabel;
    private javax.swing.JTextField emailField;
    private javax.swing.JLabel emailLabel;
    private javax.swing.JLabel emailLabel1;
    private javax.swing.JLabel employeeLabel;
    private javax.swing.JLabel fNameLabel;
    private javax.swing.JRadioButton femaleRadioButton;
    private javax.swing.JTextField firstNameField;
    private javax.swing.JButton insertJobButton;
    private javax.swing.JButton insertPersonButton;
    private javax.swing.JButton insertSkillButton;
    private javax.swing.JTextField jobIDField;
    private javax.swing.JLabel jobIDLabel;
    private javax.swing.JList<String> jobList;
    private javax.swing.JScrollPane jobScrollPane;
    private javax.swing.JLabel lNameLabel;
    private javax.swing.JTextField lastNameField;
    private javax.swing.JTextField levelField;
    private javax.swing.JLabel levelLabel;
    private javax.swing.JPopupMenu listPopupMenu;
    private javax.swing.JRadioButton maleRadioButton;
    private javax.swing.JMenuItem modifyOption;
    private javax.swing.JTextField payRateField;
    private javax.swing.JLabel payRateLabel;
    private javax.swing.JList<String> personList;
    private javax.swing.JScrollPane personScrollPane;
    private javax.swing.JTextField phoneField;
    private javax.swing.JTextField positionIDField;
    private javax.swing.JLabel positionIdLabel;
    private javax.swing.JRadioButton salaryRadioButton;
    private javax.swing.JList<String> skillList;
    private javax.swing.JScrollPane skillScrollPane;
    private javax.swing.JTextField skillTitleField;
    private javax.swing.JLabel skillTitleLabel;
    private javax.swing.JRadioButton wageRadioButton;
    // End of variables declaration                   
}
