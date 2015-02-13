From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] fs: nfsd:xdr4.h: add missing conditional group CONFIG_NFSD_V3
Date: Fri, 13 Feb 2015 11:18:38 -0800
Message-ID: <54DE4E0E.2000206@roeck-us.net>
References: <1423778953-28307-1-git-send-email-baspeters93@gmail.com> <20150212230201.GB17998@roeck-us.net> <20150213145121.GC6808@fieldses.org> <54DE2BE9.5030706@roeck-us.net> <20150213173348.GD6808@fieldses.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38316 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbbBMTSm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2015 14:18:42 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YMLlB-003cwL-O6
	for linux-next@vger.kernel.org; Fri, 13 Feb 2015 19:18:41 +0000
In-Reply-To: <20150213173348.GD6808@fieldses.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Bas Peters <baspeters93@gmail.com>, hch@lst.de, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, jim.epost@gmail.com

On 02/13/2015 09:33 AM, J. Bruce Fields wrote:
[...]
>
>> Result is that every build with NFS configured but not NSFv3 is
>> now broken.
>
> Fortunately a v2-only server would be pretty unusual these days.
>
> I don't know, maybe this?
>
> --b.
>
> commit 535c381153631af3bc708a97e267a2a6a86ee030
> Author: J. Bruce Fields <bfields@redhat.com>
> Date:   Fri Feb 13 12:27:39 2015 -0500
>
>      nfsd4: fix v3-less build
>
>      Includes of pnfs.h in export.c and fcntl.c also bring in xdr4.h, which
>      won't build without CONFIG_NFSD_V3, breaking non-V3 builds.  Ifdef-out
>      most of pnfs.h in that case.
>
>      Reported-by: Bas Peters <baspeters93@gmail.com>
>      Reported-by: Jim Davis <jim.epost@gmail.com>
>      Fixes: 9cf514ccfac "nfsd: implement pNFS operations"
>     Signed-off-by: J. Bruce Fields <bfields@redhat.com>

Passes all my build and runtime tests.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
