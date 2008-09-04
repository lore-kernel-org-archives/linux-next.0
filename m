From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for September 3
Date: Thu, 4 Sep 2008 00:15:58 -0700
Message-ID: <20080904001558.875f58b1.akpm@linux-foundation.org>
References: <20080903191619.6b6b230e.sfr@canb.auug.org.au>
	<20080903214634.ea17ff53.akpm@linux-foundation.org>
	<20080903215455.792c78a3.akpm@linux-foundation.org>
	<20080904145744.3f791ca7.sfr@canb.auug.org.au>
	<20080903220546.bd673658.akpm@linux-foundation.org>
	<20080904152015.3145b06e.sfr@canb.auug.org.au>
	<20080903230129.806d54af.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:50253 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751505AbYIDHQa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 03:16:30 -0400
In-Reply-To: <20080903230129.806d54af.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Yinghai Lu <yhlu.kernel@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Wed, 3 Sep 2008 23:01:29 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> I'll see if I cen reproduce the bug I'm
> actually tring to find with E100=n.

OK, this regression[*] bisects down to

commit b689ad2b010f09626a6158e1213a075a1aa9f299
Author: Alan Cox <alan@redhat.com>
Date:   Wed Sep 3 10:12:18 2008 +1000

    tty-kref-get-current-tty
    
    We now return a kref covered tty reference. That ensures the tty structure
    doesn't go away when you have a return from get_current_tty. This is not
    enough to protect you from most of the resources being freed behind your
    back - yet.
    

This got a bit ugly, because tty-kref-get-current-tty fixes a pile of
compilation errors which were introduced in the innediately preceding
patch (tty-kref-modcount, I think).  I roughly fixed those up by hand:

--- a/drivers/char/tty_io.c~b
+++ a/drivers/char/tty_io.c
@@ -1283,7 +1283,7 @@ static int init_dev(struct tty_driver *d
 		o_tty = alloc_tty_struct();
 		if (!o_tty)
 			goto free_mem_out;
-		if (!try_module_get(driver->other)) {
+		if (!try_module_get(driver->owner)) {
 			/* This cannot in fact currently happen */
 			free_tty_struct(o_tty);
 			o_tty = NULL;
@@ -1408,7 +1408,7 @@ end_init:
 free_mem_out:
 	kfree(o_tp);
 	if (o_tty) {
-		module_put(o_tty->driver);
+		module_put(o_tty->driver->owner);
 		free_tty_struct(o_tty);
 	}
 	kfree(ltp);
@@ -1469,7 +1469,7 @@ static void release_one_tty(struct kref 
 	tty->magic = 0;
 	/* FIXME: locking on tty->driver->refcount */
 	tty->driver->refcount--;
-	module_put(driver->owner);
+	module_put(tty->driver->owner);
 
 	file_list_lock();
 	list_del_init(&tty->tty_files);
_


I cannot find any of these patches on a mailing list.

I cannot revert tty-kref-get-current-tty and I can't immediately spot
the bug in it.

I could revert the whole tty tree, but I'd prefer that you do it,
please.  I've been trying for two days to get a -mm out, but I'm
building on a foundation of straw :(


[*] symptoms: there are no login prompts appearing on the VT consoles. 
sshd works OK (will it did, but I had to disable the net driver due to
networking bisect breakage).

config: http://userweb.kernel.org/~akpm/config-sony.txt
dmesg: http://userweb.kernel.org/~akpm/dmesg-sony-2.txt
