From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the xen-tip tree with the pm tree
Date: Tue, 12 Jul 2016 14:14:21 +0200
Message-ID: <2723893.NgNEmdq9TU@vostro.rjw.lan>
References: <20160712140926.49958101@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:52958 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750760AbcGLMJh (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jul 2016 08:09:37 -0400
In-Reply-To: <20160712140926.49958101@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Shannon Zhao <shannon.zhao@linaro.org>

On Tuesday, July 12, 2016 02:09:26 PM Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xen-tip tree got a conflict in:
> 
>   drivers/acpi/scan.c
> 
> between commit:
> 
>   68bdb6773289 ("ACPI: add support for ACPI reconfiguration notifiers")
> 
> from the pm tree and commit:
> 
>   c8ac8b6fb495 ("Xen: ACPI: Hide UART used by Xen")
> 
> from the xen-tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks good to me, thanks Stehpen!

Best,
Rafael
