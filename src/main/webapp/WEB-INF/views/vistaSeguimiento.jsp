<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Habito" %>
<%@ page import="com.example.model.RegistroHabito" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vista de Seguimiento - Sistema de Seguimiento</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Inter:wght@400;500&family=Dancing+Script:wght@500&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background: #E9F7EF;
            min-height: 100vh;
            padding: 20px;
            color: #555555;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            background: white;
            padding: 2rem;
            border-radius: 16px;
            margin-bottom: 2rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            text-align: center;
        }
        
        h1 {
            font-family: 'Poppins', sans-serif;
            color: #555555;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .subtitle {
            font-family: 'Dancing Script', cursive;
            color: #888888;
            font-size: 18px;
            font-weight: 500;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
        }
        
        .stat-icon {
            font-size: 48px;
            margin-bottom: 15px;
            filter: grayscale(20%) brightness(1.1);
        }
        
        .stat-value {
            font-family: 'Poppins', sans-serif;
            font-size: 36px;
            font-weight: 700;
            color: #FFD6A5;
            margin-bottom: 5px;
        }
        
        .stat-label {
            font-size: 13px;
            color: #888888;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .habitos-section {
            background: white;
            padding: 2rem;
            border-radius: 16px;
            margin-bottom: 2rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        
        h2 {
            font-family: 'Poppins', sans-serif;
            color: #555555;
            font-weight: 600;
            margin-bottom: 1.5rem;
            font-size: 24px;
            border-bottom: 3px solid #FFD6A5;
            padding-bottom: 10px;
        }
        
        .habito-card {
            background: #F3E8FF;
            padding: 1.5rem;
            border-radius: 16px;
            margin-bottom: 1.5rem;
            border-left: 5px solid #FFD6A5;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
        }
        
        .habito-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            transform: translateY(-3px);
        }
        
        .habito-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .habito-nombre {
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            font-weight: 600;
            color: #555555;
        }
        
        .habito-racha {
            background: #FFD6A5;
            color: #555555;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
        }
        
        .progress-bar-container {
            background: rgba(255, 255, 255, 0.6);
            height: 30px;
            border-radius: 15px;
            overflow: hidden;
            margin-bottom: 15px;
            position: relative;
        }
        
        .progress-bar {
            height: 100%;
            background: #A8E6CF;
            transition: width 0.5s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #555555;
            font-weight: 600;
        }
        
        .registros-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 10px;
            margin-top: 15px;
        }
        
        .registro-item {
            padding: 12px;
            border-radius: 12px;
            text-align: center;
            font-size: 12px;
            font-weight: 600;
        }
        
        .registro-cumplido {
            background: #A8E6CF;
            color: #555555;
        }
        
        .registro-no-cumplido {
            background: #FFB6B9;
            color: #555555;
        }
        
        .registro-parcial {
            background: #FFD6A5;
            color: #555555;
        }
        
        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 2rem;
        }
        
        .btn {
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 16px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            display: block;
        }
        
        .btn-primary {
            background: #FFD6A5;
            color: #555555;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 214, 165, 0.4);
            background: #FFC78C;
        }
        
        .btn-success {
            background: #A8E6CF;
            color: #555555;
        }
        
        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(168, 230, 207, 0.4);
            background: #90E0BC;
        }
        
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #888888;
        }
        
        .empty-icon {
            font-size: 64px;
            margin-bottom: 20px;
            opacity: 0.6;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📊 Vista de Seguimiento</h1>
            <p class="subtitle">Monitorea tu progreso y mantén tus hábitos al día</p>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">🎯</div>
                <div class="stat-value" id="totalHabitos">0</div>
                <div class="stat-label">Hábitos Activos</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">✅</div>
                <div class="stat-value" id="habitosCumplidos">0</div>
                <div class="stat-label">Cumplidos Hoy</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">🔥</div>
                <div class="stat-value" id="rachaMaxima">0</div>
                <div class="stat-label">Racha Máxima</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">📈</div>
                <div class="stat-value" id="porcentaje">0%</div>
                <div class="stat-label">Tasa de Éxito</div>
            </div>
        </div>
        
        <div class="habitos-section">
            <h2>🎯 Mis Hábitos y Progreso</h2>
            
            <%
                List<Habito> habitos = (List<Habito>) request.getAttribute("habitos");
                if (habitos != null && !habitos.isEmpty()) {
                    for (Habito habito : habitos) {
                        List<RegistroHabito> registros = habito.getRegistros();
                        int totalRegistros = registros != null ? registros.size() : 0;
                        int cumplidos = 0;
                        
                        if (registros != null && habito.getMetaDiaria() != null) {
                            for (RegistroHabito r : registros) {
                                if (r.getCompletado() != null && r.getCompletado() >= habito.getMetaDiaria()) {
                                    cumplidos++;
                                }
                            }
                        }
                        
                        int progreso = totalRegistros > 0 ? (cumplidos * 100 / totalRegistros) : 0;
                        int rachaActual = habito.calcularRachaActual();
            %>
            <div class="habito-card">
                <div class="habito-header">
                    <div class="habito-nombre"><%= habito.getNombre() %></div>
                    <div class="habito-racha">🔥 Racha: <%= rachaActual %> días</div>
                </div>
                
                <div class="progress-bar-container">
                    <div class="progress-bar" data-progreso="<%= progreso %>">
                        <%= progreso %>% completado
                    </div>
                </div>
                
                <div style="color: #888888; font-size: 14px; margin-bottom: 10px;">
                    <strong><%= cumplidos %></strong> de <strong><%= totalRegistros %></strong> registros cumplidos
                </div>
                
                <% if (registros != null && !registros.isEmpty()) { %>
                <details>
                    <summary style="cursor: pointer; color: #667eea; font-weight: 600;">
                        Ver registros (<%= totalRegistros %>)
                    </summary>
                    <div class="registros-list">
                        <% for (RegistroHabito registro : registros) { 
                            String claseEstado = "";
                            Integer completado = registro.getCompletado();
                            Integer metaDiaria = habito.getMetaDiaria();
                            
                            if (completado != null && metaDiaria != null && completado >= metaDiaria) {
                                claseEstado = "registro-cumplido";
                            } else if (completado != null && completado > 0) {
                                claseEstado = "registro-parcial";
                            } else {
                                claseEstado = "registro-no-cumplido";
                            }
                        %>
                        <div class="registro-item <%= claseEstado %>">
                            <%= registro.getFecha() %><br>
                            <%= completado != null ? completado : 0 %>/<%= metaDiaria != null ? metaDiaria : 0 %>
                        </div>
                        <% } %>
                    </div>
                </details>
                <% } %>
            </div>
            <%
                    }
                } else {
            %>
            <div class="empty-state">
                <div class="empty-icon">📭</div>
                <h3>No tienes hábitos registrados</h3>
                <p>Comienza agregando tu primer hábito para hacer seguimiento</p>
            </div>
            <% } %>
        </div>
        
        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/controlador-objetivos?action=planificar" class="btn btn-success">
                ➕ Crear Nuevo Hábito
            </a>
            <a href="${pageContext.request.contextPath}/controlador-habitos?action=list&usuarioId=usuario_demo" class="btn btn-primary">
                📝 Marcar Cumplimiento Hoy
            </a>
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn" style="background: #FFB6B9; color: #555555;">
                🏠 Volver al Inicio
            </a>
        </div>
    </div>
    
    <script>
        // Calcular estadísticas
        document.addEventListener('DOMContentLoaded', function() {
            // Aplicar el ancho de las barras de progreso
            document.querySelectorAll('.progress-bar').forEach(bar => {
                const progreso = bar.getAttribute('data-progreso');
                if (progreso) {
                    bar.style.width = progreso + '%';
                }
            });
            
            const habitosCards = document.querySelectorAll('.habito-card');
            const totalHabitos = habitosCards.length;
            
            let habitosCumplidosHoy = 0;
            let rachaMaxima = 0;
            let totalPorcentaje = 0;
            
            // Obtener fecha de hoy en formato YYYY-MM-DD
            const hoy = new Date().toISOString().split('T')[0];
            
            habitosCards.forEach(card => {
                // Obtener racha
                const rachaText = card.querySelector('.habito-racha').textContent;
                const racha = parseInt(rachaText.match(/\d+/)[0]);
                if (racha > rachaMaxima) rachaMaxima = racha;
                
                // Obtener porcentaje
                const progressBar = card.querySelector('.progress-bar');
                const progreso = parseInt(progressBar.getAttribute('data-progreso'));
                totalPorcentaje += progreso;
                
                // Verificar si hay un registro cumplido hoy
                const registros = card.querySelectorAll('.registro-item.registro-cumplido');
                registros.forEach(registro => {
                    const textoFecha = registro.textContent.trim();
                    // La fecha está en formato YYYY-MM-DD en el primer renglón
                    if (textoFecha.includes(hoy)) {
                        habitosCumplidosHoy++;
                    }
                });
            });
            
            const promedioExito = totalHabitos > 0 ? Math.round(totalPorcentaje / totalHabitos) : 0;
            
            document.getElementById('totalHabitos').textContent = totalHabitos;
            document.getElementById('habitosCumplidos').textContent = habitosCumplidosHoy;
            document.getElementById('rachaMaxima').textContent = rachaMaxima;
            document.getElementById('porcentaje').textContent = promedioExito + '%';
        });
    </script>
</body>
</html>
