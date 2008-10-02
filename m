From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: /proc git tree
Date: Fri, 3 Oct 2008 01:26:32 +0400
Message-ID: <20081002212632.GA5852@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.188]:48153 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754003AbYJBVZM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Oct 2008 17:25:12 -0400
Received: by nf-out-0910.google.com with SMTP id d3so521631nfc.21
        for <linux-next@vger.kernel.org>; Thu, 02 Oct 2008 14:25:11 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: akpm@osdl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, torvalds@osdl.org

Please, add the following to the list of poor souls:

	git://git.kernel.org/pub/scm/linux/kernel/git/adobriyan/proc.git proc

So far it consists of 5 trivial patches from -mm, in future there will
be smallish fs/proc/ reorganization, removing final defense line of ->r=
ead_proc()
users and officially bug-free=B9 examples of showing stuff via seq_file=
s.

Hope, nobody minds.

	Alexey

=B9 Maximum allowed concentration of bugs is 0.42%/LOC.
