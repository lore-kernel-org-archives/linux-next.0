From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Subject: iptables-1.4.0 with 2.6.26
Date: Tue, 19 Aug 2008 13:34:31 +0200
Message-ID: <48AAAFC7.10100@cetrtapot.si>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from n1.cetrtapot.si ([89.212.80.162]:52566 "EHLO n1.cetrtapot.si"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753335AbYHSME6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Aug 2008 08:04:58 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id E9B59BEC8
	for <linux-next@vger.kernel.org>; Tue, 19 Aug 2008 13:34:33 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lP74H0aPAbVi for <linux-next@vger.kernel.org>;
	Tue, 19 Aug 2008 13:34:31 +0200 (CEST)
Received: from [172.31.65.135] (inside.kranj.cetrtapot.si [192.168.66.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id 33B14BED8
	for <linux-next@vger.kernel.org>; Tue, 19 Aug 2008 13:34:31 +0200 (CEST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi,

Trying to build iptables-1.4.0 with 2.6.26 kernel on x86 fails with:

hinkok@alala /tmp/iptables-1.4.0 $ make
Extensions found:
cc -O2 -Wall -Wunused -I"/lib/modules/2.6.26/build"/include -I"/lib/mod=
ules/2.6.26/source"/include -Iinclude/ -DIPTABLES_VERSION=3D\"1.4.0\"  =
-fPIC -o extensions/libxt_sctp_sh.o -c extensions/libxt_sctp.c
In file included from extensions/libxt_sctp.c:23:
/lib/modules/2.6.26/build/include/linux/netfilter/xt_sctp.h:68: error: =
expected '=3D', ',', ';', 'asm' or '__attribute__' before '__sctp_chunk=
map_is_clear'
/lib/modules/2.6.26/build/include/linux/netfilter/xt_sctp.h:80: error: =
expected '=3D', ',', ';', 'asm' or '__attribute__' before '__sctp_chunk=
map_is_all_set'
extensions/libxt_sctp.c: In function 'print_chunks':
extensions/libxt_sctp.c:416: warning: implicit declaration of function =
'__sctp_chunkmap_is_clear'
extensions/libxt_sctp.c:421: warning: implicit declaration of function =
'__sctp_chunkmap_is_all_set'
make: *** [extensions/libxt_sctp_sh.o] Error 1

I think it complains about the bool type.

Regards,
Hinko

--=20
=C8ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
