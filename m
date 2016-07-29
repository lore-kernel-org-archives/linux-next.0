From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Fri, 29 Jul 2016 11:45:41 +1000
Message-ID: <20160729114541.038fcf4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39298 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751036AbcG2Bpn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Jul 2016 21:45:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Chris Wilson <chris@chris-wilson.co.uk>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_debugfs.c

between commit:

  194dc870a589 ("Add braces to avoid "ambiguous =E2=80=98else=E2=80=99"=
 compiler warnings")

from Linus' tree and commit:

  24f1d3cc0997 ("drm/i915: Refactor execlists default context pinning")

from the drm tree.

I fixed it up (I just used the version from the drm tree) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflictin=
g
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell
