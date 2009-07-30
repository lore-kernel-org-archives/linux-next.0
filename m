From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: linux-next: manual merge of the edac-amd tree with the rr tree
Date: Thu, 30 Jul 2009 13:09:39 +0200
Message-ID: <20090730110938.GA16659@aftab>
References: <20090730154150.d4c326b5.sfr@canb.auug.org.au>
 <20090730062309.GA15057@liondog.tnic>
 <20090730170850.6d777e96.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:5236 "EHLO
	TX2EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752071AbZG3LKW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2009 07:10:22 -0400
Content-Disposition: inline
In-Reply-To: <20090730170850.6d777e96.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Borislav Petkov <petkovbb@googlemail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Andreas Herrmann <andreas.herrmann3@amd.com>

Hi Stephen,

On Thu, Jul 30, 2009 at 05:08:50PM +1000, Stephen Rothwell wrote:
> > thanks for fixing that. Yep, the topology patches in the edac tree =
are
> > not final yet, I've added them to the mix only because edac depends=
 on
> > the node_id functionality. I'll fix them up later against the rr st=
uff.

I rediffed the topology bits against
cpumask:remove-topology_core_siblings-and-topology_thread_siblings-core=
=2E
patch from Rusty's tree so we should be good to go.

Also, I'm carrying couple of patches that should go through the x86 tre=
e
and depending on when they go in, I'll drop them from mine. Just wanted
to give you heads up here in case you start getting merge conflicts :).

Thanks.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
