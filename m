Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437010;
	b=Xjjtw/GKqDMLBAWXu6jmSZHC8RYBihd/g+psjc0+afuZustlojWm+3ytcIO3UUTDTpQ5
	 L7jIUbVz6qp4xeYxto3u/22aRSlaxPWRuwXW6MelVx1wfzg0xBdIWmwmrBbW+M0ysyaFG
	 hcvCaQZePtso30YeTUMeJUU6LI5ptIUdwLS7C0a1RaqaBpY8Xyr6hNFUB4Je5SmXj+iLc
	 RHPOGVBuYIpuvW+Mk4wy1XylXxC6T0hb4ue540wXpsiNl7WnBb+iyElhjcUkL/ZQFPv5j
	 1AdUNs5+uPV3QdDzdXhwLRBSnky5+cNG1+nOC0UCR+h9jvWIn7GZgxbMo2g8GWf9Mfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437010;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+F1jhGMf21HkrZdOfVPXDlEI0r76P/F659njEp2hnDA=;
	b=HFXQjSkGOTyFcmwOhvJA9n6334MCEsdlyBWYuinxQXGz+VdptL8ypzlP+Grdt5yUK33e
	 rKBmPuX8oGoFiE+O4jAq7Xgiq4n4E/f3YjQ2JofXRjOjpjjhCFpwyqx05xt+bU4PStaTV
	 YlnnBu71rRBRQ8Ny4UHgHA7pnTQPm2fGDTrYP8S54VD5x05NHtS3mb1yOA3uIXWmpky7D
	 UXjSf9l+0yPhEoHvpW68JYudq5cg6JhYZWjKaW9keGL4rvm4XQMLhlluB92M/WCpjLGha
	 NQh41LSZD4HOsEFYxjejtVOvhQxx2jYPZSw5XxUX0ncjm5XIjK0nSsroIItrhtAAKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=NfIkgu9P;
	arc=none smtp.remote-ip=91.218.175.23
Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC8606A332
	for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 19:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BCC8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=NfIkgu9P
X-Envelope-To: linux-next@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R1ooMpzJfDXEJhw31jjPShmqE1PQVzInQ4NZAiNJuwQ=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792437007; v=1; x=1793041807;
 b=NfIkgu9Pjlb9eL+ezRds2ANd/LoZjtA5qNosltJIRNfuvTG2Jv1mg+Yxe+6aEgbnTzoyrdOw
 TZ1jFLlm2aw9wKApkbyF52i5RykqpTYbVYfcqyhKvQL8jLPq3ahuyta7R17BfPZKxDsyRqZRGTF
 mewnv8sbBlZfC7hoj3Rf01S5bbYhY0XuwWcf5vJkzf5zeK/ASo7tXn2RmKeiL4sXFDYURwyl9V6
 poH5EbMK3g7zjWRPgWoWilvurtBpXQhDpFYLQVD/bDgwDiY5hk3vp0rGR/NCbc/dbIX6KiQ9jg4
 77MIfaRJRchm1sFv8L6GHstIkaZleBEqmQPiRVQLctqtg==
X-Envelope-To: linux-next@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d5b732558af1ad71;
	Mon, 19 Oct 2026 19:10:06 +0000
X-Mizu-Trace-ID: d5b732558af1ad71
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>,
	DRI <dri-devel@lists.freedesktop.org>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	luyuantao <luyuantao@kylinos.cn>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Date: Mon, 19 Oct 2026 12:09:59 -0700
Message-ID: <20261019190959.799653-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atZBBqj4ON6kYWSK@sirena.co.uk>
References: <atZBBqj4ON6kYWSK@sirena.co.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mark,

On Mon, Oct 19, 2026 at 05:10:46PM +0100, Mark Brown wrote:
> This obviously isn't the right merge, it drops the fixes.

Two of those fixes are mine, so I had a go at it. The code that draws
the panic screen was moved into drm_panic_helper.c in drm-next, so two of
the three need to move with it. The third one, for the panic screen
setting, made it through your merge fine. Today's drm-tip has the same
gap.

This puts the two back, on top of your merge:

diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_panic_helper.c
index 8913c3d22e8d..385a07ed314b 100644
--- a/drivers/gpu/drm/drm_panic_helper.c
+++ b/drivers/gpu/drm/drm_panic_helper.c
@@ -513,7 +513,8 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 	struct kmsg_dump_iter iter;
-	char kmsg_buf[512];
+	/* the size printk formats one record into, too big for the stack */
+	static char kmsg_buf[2048];
 	size_t kmsg_len;
 	struct drm_panic_line line;
 	int yoffset;
@@ -530,10 +531,15 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
 	drm_panic_helper_fill(sb, &r_screen, bg_color);
 
 	kmsg_dump_rewind(&iter);
-	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
+	while (yoffset >= 0 && kmsg_dump_get_buffer(&iter, false, kmsg_buf,
+	       sizeof(kmsg_buf), &kmsg_len)) {
 		char *start;
 		char *end;
 
+		/* a record that does not fit comes back empty, every time */
+		if (!kmsg_len)
+			break;
+
 		/* ignore terminating NUL and newline */
 		start = kmsg_buf + kmsg_len - 2;
 		end = kmsg_buf + kmsg_len - 1;

I tried it in QEMU on drm-next, ten runs of each:

    after the panic                     your merge   with this
    sysrq c                             reboots      reboots
    one 600 character line              hangs        reboots
    600 characters, then 400 lines      hangs        reboots
    one record over 2048 bytes          hangs        reboots
    oops, 1008 character modules line   hangs        reboots

The drm_panic KUnit tests pass with and without it.

Thanks for catching it,
Devin
