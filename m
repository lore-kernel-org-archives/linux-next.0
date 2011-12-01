From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: linux-next not booting on snowball
Date: Thu, 01 Dec 2011 15:51:00 +0100
Message-ID: <4ED79454.1090304@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:58159 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754766Ab1LAOvF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2011 09:51:05 -0500
Received: by qadb14 with SMTP id b14so252472qad.19
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2011 06:51:05 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi all,

I am using the linux-next head git tree on a snowball V5.

The kernel hangs at "Uncompressing kernel... done".

After bisecting, the patch where the kernel does no longer boot is:

commit 549158d2ab01e8370d2773044fe09738a26f7086
Author: Nicolas Pitre <nicolas.pitre@linaro.org>
Date:   Thu Aug 25 00:35:59 2011 -0400

    ARM: move iotable mappings within the vmalloc region
   
    In order to remove the build time variation between different SOCs
with
    regards to VMALLOC_END, the iotable mappings are now allocated inside
    the vmalloc region.  This allows for VMALLOC_END to be identical
across
    all machines.
   
    The value for VMALLOC_END is now set to 0xff000000 which is right
where
    the consistent DMA area starts.
   
    To accommodate all static mappings on machines with possible
highmem usage,
    the default vmalloc area size is changed to 240 MB so that
VMALLOC_START
    is no higher than 0xf0000000 by default.
   
    Signed-off-by: Nicolas Pitre <nicolas.pitre@linaro.org>
    Tested-by: Stephen Warren <swarren@nvidia.com>
    Tested-by: Kevin Hilman <khilman@ti.com>
    Tested-by: Jamie Iles <jamie@jamieiles.com>

Is it a known issue ?

kernel config file : http://pastebin.com/E6HngT58

Thanks
  -- Daniel

- -- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO15RUAAoJEAKBbMCpUGYA+JkIALr9uQl2EgpCuvjo9udAs6LI
dqM1w0BvMpr2WxcMO0pUvqsCKMKBcuWz6sC/BZjCJmpcxT5H8Am6YJTFq4l4y+tO
09Ggt2fK3AUWH6CBlja8HD0MEQkkjv45tiFWS0s6qFdd4MhhII+P9M04kSwaQ24u
PWwCiPofwx2RfYGM7an7VBpTAgqOuIaL5CUJdjDL5wgHsZW/qE5hQVN+V/V47TPq
1M1A9xaBs+3BhU0yTe8JMstaXoGqTgehkE5puFXZ+6f+qhLRJZTRXwu2lHbXCdyf
rcByM65gB3cSfb555DKnXgK7qB4T2n0t/nilkkT1PaO7sM0I9E4O2wdQk5KvtbE=
=RaPn
-----END PGP SIGNATURE-----
