From: Joe Peterson <joe@skyrush.com>
Subject: [PATCH 2/2 (resubmission)] n_tty: move echoctl check and clean up
 logic
Date: Wed, 09 Sep 2009 15:03:47 -0600
Message-ID: <4AA81833.1040807@skyrush.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020102070305060409000401"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f217.google.com ([209.85.220.217]:32810 "EHLO
	mail-fx0-f217.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753945AbZIIVDu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2009 17:03:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: greg@kroah.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org

This is a multi-part message in MIME format.
--------------020102070305060409000401
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------020102070305060409000401
Content-Type: text/plain;
 name="n_tty-move-echoctl-check-and-clean-up-logic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="n_tty-move-echoctl-check-and-clean-up-logic.patch"

Check L_ECHOCTL before insertting a character in the echo buffer
(rather than as the buffer is processed), to be more consistent with
when all other L_ flags are checked.  Also cleaned up the related logic.

Note that this and the previous patch ("n_tty: honor opost flag for echoes")
were verified together by the reporters of the bug that patch addresses
(http://bugs.linuxbase.org/show_bug.cgi?id=2692), and the test now passes.

Signed-off-by: Joe Peterson <joe@skyrush.com>
---

diff -Nurp b/drivers/char/n_tty.c c/drivers/char/n_tty.c
--- b/drivers/char/n_tty.c	2009-09-09 14:17:35.516776962 -0600
+++ c/drivers/char/n_tty.c	2009-09-09 14:20:36.123394364 -0600
@@ -577,33 +577,23 @@ static void process_echoes(struct tty_st
 				break;
 
 			default:
-				if (iscntrl(op)) {
-					if (L_ECHOCTL(tty)) {
-						/*
-						 * Ensure there is enough space
-						 * for the whole ctrl pair.
-						 */
-						if (space < 2) {
-							no_space_left = 1;
-							break;
-						}
-						tty_put_char(tty, '^');
-						tty_put_char(tty, op ^ 0100);
-						tty->column += 2;
-						space -= 2;
-					} else {
-						if (!space) {
-							no_space_left = 1;
-							break;
-						}
-						tty_put_char(tty, op);
-						space--;
-					}
-				}
 				/*
-				 * If above falls through, this was an
-				 * undefined op.
+				 * If the op is not a special byte code,
+				 * it is a ctrl char tagged to be echoed
+				 * as "^X" (where X is the letter
+				 * representing the control char).
+				 * Note that we must ensure there is
+				 * enough space for the whole ctrl pair.
+				 *
 				 */
+				if (space < 2) {
+					no_space_left = 1;
+					break;
+				}
+				tty_put_char(tty, '^');
+				tty_put_char(tty, op ^ 0100);
+				tty->column += 2;
+				space -= 2;
 				cp += 2;
 				nr -= 2;
 			}
@@ -810,8 +800,8 @@ static void echo_char_raw(unsigned char 
  *	Echo user input back onto the screen. This must be called only when
  *	L_ECHO(tty) is true. Called from the driver receive_buf path.
  *
- *	This variant tags control characters to be possibly echoed as
- *	as "^X" (where X is the letter representing the control char).
+ *	This variant tags control characters to be echoed as "^X"
+ *	(where X is the letter representing the control char).
  *
  *	Locking: echo_lock to protect the echo buffer
  */
@@ -824,7 +814,7 @@ static void echo_char(unsigned char c, s
 		add_echo_byte(ECHO_OP_START, tty);
 		add_echo_byte(ECHO_OP_START, tty);
 	} else {
-		if (iscntrl(c) && c != '\t')
+		if (L_ECHOCTL(tty) && iscntrl(c) && c != '\t')
 			add_echo_byte(ECHO_OP_START, tty);
 		add_echo_byte(c, tty);
 	}


--------------020102070305060409000401--
