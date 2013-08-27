From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the usb tree
Date: Tue, 27 Aug 2013 10:54:57 +0200
Message-ID: <521C6961.9020103@linutronix.de>
References: <20130827181353.319c150858829df1bb68d60b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:35666 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753596Ab3H0IzG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2013 04:55:06 -0400
In-Reply-To: <20130827181353.319c150858829df1bb68d60b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>

On 08/27/2013 10:13 AM, Stephen Rothwell wrote:

> Today's linux-next merge of the arm-soc tree got a conflict in 
> arch/arm/boot/dts/am335x-bone.dts between commit 97238b35d5bb
> ("usb: musb: dsps: use proper child nodes") from the  tree and
> commit 63f6b2550aa0 ("ARM: dts: AM33XX: don't redefine OCP bus and
> device nodes") from the arm-soc tree.
> 
> I fixed it up (probably incorrectly - see below) and can carry the
> fix as necessary (no action is required).

You added the OCP node back and the USB nodes as I had them which
should be fine.

How do we solve the conflict for the merge window? Is it possible for
the ARM-SOC tree to create a topic branch for this commit?

Greg: I do have a pending pull / patches [0] which also change the dts
nodes according to the latest feedback + enabling an additional USB
port in bone.
If you take this in I could update the nodes later (with the topic
branch merged) accordingly to the way it has been done in the ARM-SOC
tree - unless you have other preferences.

[0] http://www.spinics.net/lists/linux-usb/msg92595.html

Sebastian
