From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH] pwm: STM32 fix compilation warning
Date: Wed, 25 Jan 2017 09:50:47 +0100
Message-ID: <1485334247-28996-1-git-send-email-benjamin.gaignard@st.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: linux-next.vger.kernel.org

remove useless curstate variable.

Fixes: bafffb6e7bd1 ("pwm: Add driver for STM32 plaftorm")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/pwm/pwm-stm32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index ce6232e..6139512 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -189,7 +189,6 @@ static void stm32_pwm_disable(struct stm32_pwm *priv, int ch)
 static int stm32_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			   struct pwm_state *state)
 {
-	struct pwm_state curstate;
 	bool enabled;
 	struct stm32_pwm *priv = to_stm32_pwm_dev(chip);
 	int ret;
@@ -201,7 +200,7 @@ static int stm32_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return 0;
 	}
 
-	if (state->polarity != curstate.polarity)
+	if (state->polarity != pwm->state.polarity)
 		stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
 
 	ret = stm32_pwm_config(priv, pwm->hwpwm,
-- 
1.9.1
