From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Linux 4.0-rc1 out..
Date: Mon, 23 Feb 2015 16:15:41 +1100
Message-ID: <20150223161541.22df98cc@canb.auug.org.au>
References: <CA+55aFzS==STcTbwabdvw=7_xX08kkUd=g2Q4XbWJzKbpjyN1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=H.qroXNZG8ouDVxI1qiyFr"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41419 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751093AbbBWFPu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2015 00:15:50 -0500
In-Reply-To: <CA+55aFzS==STcTbwabdvw=7_xX08kkUd=g2Q4XbWJzKbpjyN1A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

--Sig_/=H.qroXNZG8ouDVxI1qiyFr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

I haven't done these for a while, so I haven't included a previous
release for comparison.

(No merge commits counted, next-20150209 was the last linux-next before
the merge window opened.)

Commits in v4.0-rc1 (relative to v3.19):   8950
Commits in next-20140804:		   8279
Commits with the same SHA1:		   7492
Commits with the same patch_id:		    452	(1)
Commits with the same subject line:	     70	(1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20150209:	8014	89.5%

Some breakdown of the list of extra commits (relative to next-20150209)
in -rc1:

Top ten first word of commit summary:

    103 mips
     79 staging
     37 drm
     32 lguest
     25 ib
     22 arm
     19 rdma
     19 input
     19 alsa
     18 sunrpc

Top ten authors:

     51 rusty@rustcorp.com.au
     50 markos.chandras@imgtec.com
     25 trond.myklebust@primarydata.com
     21 leonid.yegoshin@imgtec.com
     19 hch@lst.de
     17 richard.alpe@ericsson.com
     16 abbotti@mev.co.uk
     15 zyan@redhat.com
     15 arnd@arndb.de
     14 dhowells@redhat.com

Top ten commiters:

     81 gregkh@linuxfoundation.org
     75 davem@davemloft.net
     64 markos.chandras@imgtec.com
     59 rusty@rustcorp.com.au
     47 torvalds@linux-foundation.org
     43 roland@purestorage.com
     38 ralf@linux-mips.org
     31 trond.myklebust@primarydata.com
     26 mingo@kernel.org
     26 idryomov@gmail.com

There are also 265 commits in next-20150209 that didn't make it into
v4.0-rc1.

Top ten first word of commit summary:

     25 rcu
     24 arm
     20 selftests
     19 mm
     11 arm-soc
      6 documentation
      5 tracing
      5 staging
      5 libceph
      5 ceph

Top ten authors:

     36 akpm@linux-foundation.org
     34 paulmck@linux.vnet.ibm.com
     20 shuahkh@osg.samsung.com
     11 olof@lixom.net
      9 minchan@kernel.org
      7 rostedt@goodmis.org
      6 zyan@redhat.com
      6 behanw@converseincode.com
      5 tapaswenipathak@gmail.com
      4 namjae.jeon@samsung.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    102 sfr@canb.auug.org.au
     35 paulmck@linux.vnet.ibm.com
     21 shuahkh@osg.samsung.com
     11 olof@lixom.net
     10 idryomov@redhat.com
      9 kgene@kernel.org
      7 rostedt@goodmis.org
      7 behanw@converseincode.com
      7 arnd@arndb.de
      4 treding@nvidia.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/=H.qroXNZG8ouDVxI1qiyFr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6reCAAoJEMDTa8Ir7ZwVLfIP/jiNd3XIId0TVtjhAUrj/KZF
69CODyAJp0roAa50nfQptQujayivzBdMalt5/BXzXK7iRIPBlJ/5BIaFgI0Nvu3b
GLMVKV6+Xkx8CeZq2qsKOdombnDPIxoOeXnAaDKfK6CfHs6/JiQ4Mr0p7YW1Pm9V
s/unadewf94PSXx65DUeb3FZRZmWBT3WgTixnYcENfu6L9BtfpQkeXy5WbeyZjKM
ofmFDNrpy4HpXGLMvW6Vl6fq7k95IDEHtXQbkhLNn6YH1dW9r/1HF1OVvsxWfG6Y
/q3TXVMa3XeyuW2Gpq535+K4Mo9NzKfAVb5Q3ReNTJRP5b3iCMlVNvoXzW/wrUSE
fQV8BUop+NKHLyISlWjbYifcoOCrUfSXLwONw4lA5AWcKuOjkXYmcr9EKuG5SMyA
PQwl6LQYA+xDGXkQK3h7BRCkViZTF7/REO8qp27FWIK9ZnFIPg/BFQK/ZzO14ptc
Bo6vdoLh/kYBo7fpRr9jPj8o98mWaX0irVF12EBTG9oBUSjG+m98v3Hi8DL54qEo
H53tn0OzQ9ssYwyHk6yeACnHEPH8TSA1GRsV37onOl4UbmjLEDCbt1OlV9LaN4t+
2/+Th1lQ/A2PTENxwwUZkinCu/Tau60lugHjFcIBIH7lcOPMOMcSwXAeK7cqlYwZ
ZV0Hn2nfXKAGPIUyfzNZ
=rNJl
-----END PGP SIGNATURE-----

--Sig_/=H.qroXNZG8ouDVxI1qiyFr--
