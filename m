From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the tty tree
Date: Mon, 1 Feb 2016 14:51:46 +1100
Message-ID: <20160201145146.670ad8ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37906 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757572AbcBADvs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Jan 2016 22:51:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>, Shraddha Barke <shraddha.6596@gmail.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/dgap/dgap.c

between commits:

  6aa56785e735 ("staging: digi: Replace open-coded tty_wakeup()")
  2d73b069f816 ("staging: dgap: Remove redundant write_wait wakeups")
  9db276f8f021 ("tty: Use termios c_*flag macros")

from the tty tree and commit:

  7e3933df9874 ("Staging: dgap: Remove obsolete driver")

from the staging tree.

I fixed it up (I just removed the file) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell
