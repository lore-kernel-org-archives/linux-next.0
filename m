Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532212;
	b=XyDnA6BCQDceP/JU+uNSmsDpmQ692+xBNk6iNzi4a28te+sWBxtt8x5J2IGqCKvEM4FB
	 wMee0zAS8mI4TmIZtOD2/MvgNEBrkae1BmaIZlx6MbfssT/wLDEvfzQmQe/Q1DWgnwv1a
	 33gVpTSTBq9eA0ktmSNR7iS5R2qbCq0R1z4N5b+u6ADVVZhM/v9/iHJVJC0tyNwerA6+p
	 lycdjvE+tbw05Wb0YCYNl5kid8khv7ZMww5xEd0RhavHxYTO3JsXPMryh8Lqp0N0yS/Ec
	 fASGsDLZ0CCob18IwkP9c9jmQM1DShQhXfQhhmdGr+4xHgcfSCg3aikM85P6RUxnu6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532212;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BQO4GuYRTzS7IoSSUhSiErH0mQkmSCba+xRrKEQIFL4=;
	b=caNLXoDpIdMUzBhgd0KzeaR4xMKI6F4It+Z3KjaYunBYknDuPM7UWv2G/8AQW+9uNK0O
	 wN2wZeh1cn4E7oVACPfRjHGF8ZWRpWMgandONj5mCsCBdWw+96eKzw8KRi/pzFaBfxaR2
	 aHM/Uiz4C3IhS7sY2pserUWs/bi/hYbl/Z5c2hAMkp7QUs1tGRZKUS4uVEJVvYBRnyPu3
	 Suml+L+dXGrmTqvX3fhkhR4d57CxI4gnuUR6XG2oFlHsOv+4i1yDy3ekZfncvGTqmnNj2
	 68Bf8AnaP6w8wLXoGOzSCh62Uzdz0oOno5zQYkHOtB8hJud0IWTq1am39fVpG7P2+sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fD+K6Gky;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE2606A33D;
	Tue, 24 Nov 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fD+K6Gky
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3CB1F000D3;
	Tue, 24 Nov 2026 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532211;
	bh=BQO4GuYRTzS7IoSSUhSiErH0mQkmSCba+xRrKEQIFL4=;
	h=From:To:Cc:Subject:Date;
	b=fD+K6GkyuhS3ITuF17cS5fVX8PLihmTRwXUS3CVmV66f3VoZwoGZSE0cvJH+xlXKY
	 JiZu6RWeWKIzsNbw4V4TyrJhq/GH3x1Kih80Wk9oF9wbfaQ4HaGr6oLVp7s50gIrmJ
	 AWURxa3wb2LEZ8VWZ9AaUn1ZtmjalGKqHOJO/ZD7NA1cTkh7imxqX8haSzhSooTNtz
	 VW8go9zOIAqlpuo7AvWt9GXKXnxMi7n/Uf5YJCVimPSTMAPqPGAUjwkveeZTSr9nTJ
	 GqSfmtyYhNhIUke+qW/B4Gmpx358kWAo00S13IppgdQtlMjFUfr3MFfNfH5rDcxSlH
	 4jUsbSd3QtFQg==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Antonio Quartulli <antonio@mandelbit.com>,
	Jason Wang <jasowangio@gmail.com>,
	netdev@vger.kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: semantic conflict between the net and net-next trees
Date: Tue, 24 Nov 2026 09:56:49 -0500
Message-ID: <20261124145649.3656145-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark,

The current net tree has a semantic conflict with the net-next tree
that breaks the build:

  drivers/net/tun.c:1881:11: error: no member named 'ops' in 'struct ubuf_info'

3896ae4adf5f ("tun: complete the zerocopy buffer of packets consumed by
XDP") in the net tree calls uarg->ops->complete() in tun_get_user(), and
ecca9bb2c855 ("net: skbuff: replace ubuf_info ops ptr with type id") in
the net-next tree removes ubuf_info::ops. The fix uses
net_zcopy_complete(), as ecca9bb2c855 does for the same call later in
tun_get_user():

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1875,11 +1875,8 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 			goto drop;
 		if (!skb) {
 			/* consumed by XDP, after copying */
-			if (msg_control) {
-				struct ubuf_info *uarg = msg_control;
-
-				uarg->ops->complete(NULL, uarg, false);
-			}
+			if (msg_control)
+				net_zcopy_complete(NULL, msg_control, false);
 			return total_len;
 		}
 	} else {

-- 
Thanks,
Sasha
