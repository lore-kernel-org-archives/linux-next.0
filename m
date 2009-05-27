From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: edac-amd tree build warning
Date: Wed, 27 May 2009 19:12:31 +0200
Message-ID: <20090527171231.GA31292@aftab>
References: <20090527170119.c1d6b221.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:49602 "EHLO
	TX2EHSOBE007.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbZE0RMn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2009 13:12:43 -0400
Content-Disposition: inline
In-Reply-To: <20090527170119.c1d6b221.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>

Hi Stephen,

On Wed, May 27, 2009 at 05:01:19PM +1000, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>=20
> drivers/edac/amd64_edac.c: In function 'f10_get_base_addr_offset':
> drivers/edac/amd64_edac.c:1466: warning: suggest parentheses around o=
perand of '!' or change '&' to '&&' or '!' to '~'
>=20
> Introduced by commit c266e41c0ca15d5df65e42d07608fbfb51ff32e3
> ("amd64_edac: add F10h-and-later methods-p2").

Thanks for catching that. Fixed and rebased on latest Linus' tree.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
