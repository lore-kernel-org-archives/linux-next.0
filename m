Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A63E3C9892;
	Fri, 10 Jul 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685313; cv=none; b=bGuWP+Cl8GohIEIas1tgLqjHdOpMTtUabp4FIEypja/jl5Dgi5M1eKD4JRwG16xZJpSUJ6NTy2F6afvxsjcJ5BXu+/wD+GXgO1ze+LqUhzSFDvEwKkIlj+kIoBlvKFALzCaZJ+9f+GtFnsWKd7pOM4hXXxP7WLiXB1MS/wEmgzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685313; c=relaxed/simple;
	bh=Wd/wtcm3mHZvGo/y2qXhyRQVZH80tg9uGdFHU1lgsEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GizRGZ2WgUBcv8NZjdsk+4qco9LDNWowMPx38k5ka1CF/tN1ewImL/cnZI3l52tos0wau5L3v3Qqemh4Tczcz6lqyQcNPZtbIqjEwcI569FFqpIUmTh4uuRTY+c837o0tv1r3Z9PUY1wHR7u0InNbWR9mGOREod01CkyjKdAYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBF9VG/c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBF9VG/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74071F000E9;
	Fri, 10 Jul 2026 12:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783685311;
	bh=iErwGfhtTfBr7jGxbosyYw/TXCmRVB1dKcyNEk+KM5w=;
	h=Date:From:To:Cc:Subject;
	b=IBF9VG/cCGbceOBI2VGlXNcgi1ljsJe4IpfvbhayG6o9Is18Og5NUKrCmdHH29xj1
	 EWGVIMJxhSCdqVjnqYPjhsOrMWQhmi/H+KeYTJUixPS7LMKjWIjUyvmvTeZYGCRasm
	 O6qsqlban59AWk5K8ZrVxMRIl3VuFyEzHyJa8pLIggyFfy5oftlFPAjfbjg0AkRaSl
	 0K7ZqTzBTujlig+c1ydQMPpElfVJw4sj8TtyFYYTx9DWEgg8NzQvrqIdFF332VJVHk
	 lP49CB495ljzXnpfKtBxmdmicLCgn/M6c0oI9ciYPTEhXBvvXIZfHAJ+jat2k/JTTN
	 16bepsaxU5u5A==
Date: Fri, 10 Jul 2026 13:08:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <chleroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fsl tree
Message-ID: <alDgvHf9mKOJI1cc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3vMy0JNzTDwQ2SYI"
Content-Disposition: inline


--3vMy0JNzTDwQ2SYI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the fsl tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/usb/host/fhci-hcd.c:32:10: fatal error: 'asm/fsl_gtm.h' file not found
   32 | #include <asm/fsl_gtm.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/usb/host/fhci-hcd.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/drivers/usb/host/fhci-q.c:22:
/tmp/next/build/drivers/usb/host/fhci.h:449:9: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  449 |         return in_be16(&fhci->pram->frame_num) & 0x07ff;
      |                ^
1 error generated.
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/usb/host/fhci-q.o] Error 1
In file included from /tmp/next/build/drivers/usb/host/fhci-hub.c:24:
/tmp/next/build/drivers/usb/host/fhci.h:449:9: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  449 |         return in_be16(&fhci->pram->frame_num) & 0x07ff;
      |                ^
/tmp/next/build/drivers/usb/host/fhci-hub.c:95:2: error: call to undeclared function 'out_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   95 |         out_be16(&usb->fhci->regs->usb_usbmr, usb->saved_msk);
      |         ^
/tmp/next/build/drivers/usb/host/fhci-hub.c:156:9: error: call to undeclared function 'in_8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  156 |         mode = in_8(&fhci->regs->usb_usmod);
      |                ^
/tmp/next/build/drivers/usb/host/fhci-hub.c:157:2: error: call to undeclared function 'out_8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  157 |         out_8(&fhci->regs->usb_usmod, mode & (~USB_MODE_EN));
      |         ^
/tmp/next/build/drivers/usb/host/fhci-hub.c:160:9: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  160 |         mask = in_be16(&fhci->regs->usb_usbmr);
      |                ^
/tmp/next/build/drivers/usb/host/fhci-hub.c:161:2: error: call to undeclared function 'out_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  161 |         out_be16(&fhci->regs->usb_usbmr, mask & (~USB_E_IDLE_MASK));
      |         ^
6 errors generated.
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/usb/host/fhci-hub.o] Error 1
In file included from /tmp/next/build/drivers/usb/host/fhci-mem.c:21:
/tmp/next/build/drivers/usb/host/fhci.h:449:9: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  449 |         return in_be16(&fhci->pram->frame_num) & 0x07ff;
      |                ^
1 error generated.
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/usb/host/fhci-mem.o] Error 1
/tmp/next/build/drivers/usb/host/fhci-sched.c:25:10: fatal error: 'asm/fsl_gtm.h' file not found
   25 | #include <asm/fsl_gtm.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/usb/host/fhci-sched.o] Error 1
In file included from /tmp/next/build/drivers/usb/host/fhci-tds.c:22:
/tmp/next/build/drivers/usb/host/fhci.h:449:9: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  449 |         return in_be16(&fhci->pram->frame_num) & 0x07ff;
      |                ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:85:19: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   85 |                 u16 td_status = in_be16(&ep->empty_td->status);
      |                                 ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:87:3: error: call to undeclared function 'out_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   87 |                 out_be32(&ep->empty_td->buf_ptr, DUMMY_BD_BUFFER);
      |                 ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:213:3: error: call to undeclared function 'out_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  213 |                 out_be32(&td->buf_ptr, 0);
      |                 ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:214:3: error: call to undeclared function 'out_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  214 |                 out_be16(&td->status, 0);
      |                 ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:220:2: error: call to undeclared function 'out_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  220 |         out_be16(&td->status, TD_W); /* for last TD set Wrap bit */
      |         ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:248:2: error: call to undeclared function 'out_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  248 |         out_be16(&usb->fhci->regs->usb_usep[0],
      |         ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:258:2: error: call to undeclared function 'out_8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  258 |         out_8(&ep->ep_pram_ptr->rx_func_code, rt);
      |         ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:265:2: error: call to undeclared function 'out_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  265 |         out_be32(&ep->ep_pram_ptr->tx_state, 0);
      |         ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:294:15: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  294 |                 td_status = in_be16(&td->status);
      |                             ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:296:9: error: call to undeclared function 'in_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  296 |                 buf = in_be32(&td->buf_ptr);
      |                       ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:307:3: error: call to undeclared function 'clrbits16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  307 |                 clrbits16(&td->status, ~TD_W);
      |                 ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:308:3: error: call to undeclared function 'out_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  308 |                 out_be16(&td->length, 0);
      |                 ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:309:3: error: call to undeclared function 'out_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  309 |                 out_be32(&td->buf_ptr, 0);
      |                 ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:393:14: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  393 |         td_status = in_be16(&td->status);
      |                     ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:405:2: error: call to undeclared function 'out_be32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  405 |         out_be32(&td->buf_ptr, virt_to_phys(pkt->data));
      |         ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:421:2: error: call to undeclared function 'out_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  421 |         out_be16(&td->extra, extra_data);
      |         ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:462:3: error: call to undeclared function 'out_8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  462 |                 out_8(&usb->fhci->regs->usb_uscom, USB_CMD_STR_FIFO);
      |                 ^
/tmp/next/build/drivers/usb/host/fhci-tds.c:476:15: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  476 |                 td_status = in_be16(&td->status);
      |                             ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
20 errors generated.
make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/usb/host/fhci-tds.o] Error 1
In file included from /tmp/next/build/drivers/usb/host/fhci-dbg.c:20:
/tmp/next/build/drivers/usb/host/fhci.h:449:9: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  449 |         return in_be16(&fhci->pram->frame_num) & 0x07ff;
      |                ^
/tmp/next/build/drivers/usb/host/fhci-dbg.c:49:3: error: call to undeclared function 'in_8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   49 |                 in_8(&regs->usb_usmod), in_8(&regs->usb_usadr),
      |                 ^
/tmp/next/build/drivers/usb/host/fhci-dbg.c:50:27: error: call to undeclared function 'in_be16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   50 |                 in_8(&regs->usb_uscom), in_be16(&regs->usb_usep[0]),
      |                                         ^
3 errors generated.

Caused by commit

  4b265b93b4e0e (powerpc: Move CONFIG_QE_GPIO to SoC)

I have used the tree from next-20260709 instead.

--3vMy0JNzTDwQ2SYI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpQ4LsACgkQJNaLcl1U
h9Cmhgf/UrAsyAz145cxerixvGl731xqrkNqPAotIl19tVJfacsf9e+6uUhh4d1O
XNxzaZoLIQWIUemUiW6e4/XTBLwfglraMDc0vxdO5/4//+MNif3QLrlCDhm/rl0y
5eXJdwYb9IUfSUwJ2VswqM7cady+EB+Hj9+/P/Tso8y6N8s8+P9+2nJmiW+D6LS3
+mh9nx6InUB9643W/m8VvzTLREEYQOsvQN2q0lgruV+U5nuAe0fyoPZtqKcocAAl
schUAD7eX6TK3bUcFWJLnNwO9415RrrfjA2yxeIiLkYWPQ/WX8P559VVGce0W/7I
yKIQ6fzRV1mVvFO9osYXIfwPp+e8Jw==
=IuN5
-----END PGP SIGNATURE-----

--3vMy0JNzTDwQ2SYI--
