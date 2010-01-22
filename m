From: Valdis.Kletnieks@vt.edu
Subject: Re: linux-next: add utrace tree
Date: Fri, 22 Jan 2010 08:43:18 -0500
Message-ID: <18867.1264167798@localhost>
References: <20100120061551.GB6588@in.ibm.com> <20100120062834.GB12165@elte.hu> <20100120072925.GA11395@elte.hu> <20100121013822.28781960.sfr@canb.auug.org.au> <20100122111747.3c224dfd.sfr@canb.auug.org.au> <20100121163004.8779bd69.akpm@linux-foundation.org> <20100121163145.7e958c3f.akpm@linux-foundation.org> <20100122005147.GD22003@redhat.com> <20100121170541.7425ff10.akpm@linux-foundation.org> <alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
            <20100122052139.GA20532@in.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1264167798_4668P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:42740 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751450Ab0AVNp0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jan 2010 08:45:26 -0500
In-Reply-To: Your message of "Fri, 22 Jan 2010 10:51:39 +0530."
             <20100122052139.GA20532@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ananth@in.ibm.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "Frank Ch. Eigler" <fche@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>

--==_Exmh_1264167798_4668P
Content-Type: text/plain; charset=us-ascii

On Fri, 22 Jan 2010 10:51:39 +0530, Ananth N Mavinakayanahalli said:

> FWIW, Oleg's implementation of ptrace over utrace is 100% compatible
> with legacy ptrace; gdb testsuite indicates that
> (http://lkml.org/lkml/2009/12/21/98).

No, that only proves it's compatible enough for gdb to not care. The problem
is all those *other* packages that abuse ptrace in totally crackhead ways.

(No, I can't name them - but ptrace is the sort of interface that almost
encourages its use for things somewhere between crackhead and mad-scientist,
so they're almost certainly out there.. WAY out there.. :)

--==_Exmh_1264167798_4668P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFLWat2cC3lWbTT17ARAgw1AKDXe9SH3oEUDuwTIceHaY6I2GlcbwCg4B7Z
WdWk82XsrZXGeTOGHXpiUkQ=
=2WnU
-----END PGP SIGNATURE-----

--==_Exmh_1264167798_4668P--
