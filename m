From: Konrad Rzeszutek Wilk <konrad@kernel.org>
Subject: Re: [PATCH] xen: resolve merge conflict with 617276307cd4cdb9a95c77efaa3063695af63aa7
Date: Tue, 2 Oct 2012 14:51:19 -0400
Message-ID: <CACJDEmrV4uqLQ5wPGTQ7vHRAo3hHXDdWrTB5h65hfF+B9rJCgQ@mail.gmail.com>
References: <alpine.DEB.2.02.1210021724300.29232@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:45904 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751443Ab2JBSvU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Oct 2012 14:51:20 -0400
In-Reply-To: <alpine.DEB.2.02.1210021724300.29232@kaball.uk.xensource.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xen-devel@lists.xensource.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, Oct 2, 2012 at 1:29 PM, Stefano Stabellini
<stefano.stabellini@eu.citrix.com> wrote:
> The Xen tree tries to add a line to
> arch/arm/mach-vexpress/Makefile.boot that has been removed by the
> following commit in Linus' master:
>
> commit 617276307cd4cdb9a95c77efaa3063695af63aa7
> Author: Rob Herring <rob.herring@calxeda.com>
> Date:   Thu Sep 6 13:43:04 2012 -0500
>
>     ARM: vexpress: convert to multi-platform
>
> In fact the dts Makefile is now arch/arm/boot/dts/Makefile, as per
> commit 9cd11c0c47b8690b47e7573311ce5c483cb344ed.
>
>
> This is the merge resolution patch.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

Great. Thanks for posting it!
