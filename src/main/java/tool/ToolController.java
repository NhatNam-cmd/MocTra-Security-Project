package tool;

import javax.swing.*;
import java.io.File;

public class ToolController {
    private ToolView view;
    private ToolModel model;
    private File selectedKeyFile;

    public ToolController(ToolView view, ToolModel model) {
        this.view = view;
        this.model = model;
        view.btnBrowse.addActionListener(e -> browseKey());
        view.btnSign.addActionListener(e -> doSign());
    }

    public void browseKey() {
        JFileChooser fc = new JFileChooser();
        int result = fc.showOpenDialog(view);
        if (result == JFileChooser.APPROVE_OPTION) {
            selectedKeyFile = fc.getSelectedFile();
            view.txtKeyPath.setText(selectedKeyFile.getAbsolutePath());
            view.lblStatus.setText(" ");
        }
    }

    public void doSign() {
        String hash = view.txtHash.getText().trim();
        try {
            String signature = model.sign(selectedKeyFile, hash);
            view.txtSignature.setText(signature);
            view.btnCopy.setEnabled(true);
            view.lblStatus.setText("Ký thành công.");
        } catch (Exception ex) {
            view.txtSignature.setText("");
            view.btnCopy.setEnabled(false);
            view.lblStatus.setText("Lỗi: " + ex.getMessage());
        }
    }
}
