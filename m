From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the tty tree with the  tree
Date: Mon, 7 Sep 2009 11:22:11 -0700 (PDT)
Message-ID: <alpine.LFD.2.01.0909071104340.25628@localhost.localdomain>
References: <20090907191347.fe010955.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:37257 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752045AbZIGSWS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 14:22:18 -0400
In-Reply-To: <20090907191347.fe010955.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Peterson <joe@skyrush.com>



On Mon, 7 Sep 2009, Stephen Rothwell wrote:
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/char/n_tty.c between commit
> 37f81fa1f63ad38e16125526bb2769ae0ea8d332 ("n_tty: do O_ONLCR translation
> as a single write") from Linus' tree and commit
> bb2d17d83926bf9d70b922031aeb49ca896e0b3d ("tty: n_tty: honor opost flag
> for echoes") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix for a while.

Hmm. I think that the "honor opost flag for echoes" patch is actually 
wrong.

We check O_OPOST() in the _caller_ for the regular write case, and that 
test actually looks like this:

	if (O_OPOST(tty) && !(test_bit(TTY_HW_COOK_OUT, &tty->flags))) {

so at a minimum, if we add it to process_output() we should likely add it 
in the same format. But if we need that test, I'd rather do it in the 
caller anyway, like we already do for regular writes.

So maybe the patch could be changed to something (UNTESTD!) like the 
following instead? And thus avoid the conflict at the same time.

		Linus

---
 drivers/char/n_tty.c |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/drivers/char/n_tty.c b/drivers/char/n_tty.c
index 4e28b35..9c04bb4 100644
--- a/drivers/char/n_tty.c
+++ b/drivers/char/n_tty.c
@@ -345,6 +345,18 @@ static int do_output_char(unsigned char c, struct tty_struct *tty, int space)
 	return 1;
 }
 
+static int output_echo(unsigned char c, struct tty_struct *tty, int space)
+{
+	if (O_OPOST(tty) && !(test_bit(TTY_HW_COOK_OUT, &tty->flags)))
+		return do_output_char(c, tty, space);
+
+	if (!space)
+		return -1;
+
+	tty_put_char(tty, c);
+	return 1;
+}
+
 /**
  *	process_output			-	output post processor
  *	@c: character (or partial unicode symbol)
@@ -607,7 +619,7 @@ static void process_echoes(struct tty_struct *tty)
 		} else {
 			int retval;
 
-			retval = do_output_char(c, tty, space);
+			retval = output_echo(c, tty, space);
 			if (retval < 0)
 				break;
 			space -= retval;
