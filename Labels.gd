extends Node

var score = 0         # Armazena o score do jogador
var time_alive = 0.0   # Tempo de sobrevivência
var score_rate = 10    # Pontos por segundo de sobrevivência (ajustável)

# Função que roda a cada frame
func _physics_process(delta):
  #  if not paused:  # Verifica se o jogo está pausado
		# Incrementa o tempo total de sobrevivência
		time_alive += delta
		
		# Atualiza o score baseado no tempo de sobrevivência
		# Aqui você pode ajustar a taxa de pontos por segundo
		score = int(time_alive * score_rate)
		
		# Se estiver usando uma HUD, atualize o texto na tela
		update_score_display()

func update_score_display():
	# Atualiza a HUD com o score (supondo que você tenha um Label chamado 'ScoreLabel')
	var score_label = get_node("/root/Game/Labels/ScoreLabel")  # Atualize para o caminho correto da sua HUD
	score_label.text = str(score)
