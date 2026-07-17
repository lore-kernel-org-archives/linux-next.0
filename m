Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791AC422532;
	Fri, 17 Jul 2026 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299242; cv=none; b=oaCdGeweM03kI9V/n43JPjAnBJBrnuK4S6jnt7FO5IqDO3TddiB/P27YojCx0BIcimF/RlcfDGW5s6aTZu7kNnZOSWwj+vK4R4Lh6eL8p6gO76jOxgQFPfbW6ZS5J1ix6dJHKo8+Zv7BKYmYtMjIBUcWWDrGt0lGxxx+TU3uX9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299242; c=relaxed/simple;
	bh=dzKwbrG56FzQYHFmawk3msffZOzOEzPm8vPvJzD2yAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaaY/i84oyH8p8244rFdXt3Pye7nd09RpFM3jacTHXmiUZvmPnq9cKoluT0ZkGogHrAHz0tC+XWyIhX0sgOWViwivoKe+/iSvSKTHcGYJeu/RykeGmv0803JiRLj7HclowrSfZxeL/iow88SHZO2juYAGzPK/nnXzwq4drgjvqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJ3Xv+M5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJ3Xv+M5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A741F000E9;
	Fri, 17 Jul 2026 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784299241;
	bh=X6O25T6eKwwgjmcnnwjQ2bmuSqz1+pbzCGKX2Hv6vXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJ3Xv+M5Dx/7kGS+hnKzCBAqLBHTmaT0OWOdjCvHerd/ADH6zRqHD6Ks4lEzuql9X
	 RAV8JU3PaaBRmDX4mrDok35jNmfVdoSYIXNDUySnnJJ6jASA+u2p8/m7RaaW5Pbd7Q
	 TQ0yX9Z7ejEUYPRvTcZvEtI5xmEn6qbaG6QzfvAEHCz97tKHECprD9TJW74PW6S3V3
	 VzV+6EqrPNXwmHiML1215zCfPhvD1XTykSN+zxNSw8XUNkgU5EtL5Ug0GUC4wYcv7n
	 BlSWLFFnPrPM3H8cFwZJqJUrux4x8dwTNLBs1RHora2pNEvyNGCetuDCqKQsLXFTKQ
	 5zCxCs2kH/qkg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wkjjy-00000007cQW-3ERy;
	Fri, 17 Jul 2026 16:40:38 +0200
Date: Fri, 17 Jul 2026 16:40:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Mark Brown <broonie@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <alo-5gLdvyqY-TwB@hovoldconsulting.com>
References: <alUk8OTfE-f9oQo8@sirena.org.uk>
 <4f9f5ff9-8eaa-4bd5-9331-37119f78e13f@sirena.org.uk>
 <c2fe4a81c639cddb65116d9b3526e82206927c0d.camel@mailbox.org>
 <2026071734-papyrus-unmovable-5826@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026071734-papyrus-unmovable-5826@gregkh>

On Fri, Jul 17, 2026 at 04:35:44PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 17, 2026 at 03:47:55PM +0200, Manuel Ebner wrote:
> > Hi Mark, 
> > 
> > On Wed, 2026-07-15 at 16:37 +0100, Mark Brown wrote:
> > > On Mon, Jul 13, 2026 at 06:48:32PM +0100, Mark Brown wrote:
> > > > Hi all,
> > > > 
> > > > In the final builds, today's linux-next build (arm64 allyesconfig)
> > > > failed like this:
> > > 
> > > This error is due to a71f5aef1be98 (USB: gadget: fsl-udc: enable compile
> > > testing) from the usb tree, a dependency change as expected.  I'll do
> > > something about this tomorrow.
> > 
> > I stumbled across the same build errors. Are you still on this?
> 
> Should I revert that commit to resolve this?

I think we should fix the broken driver that is now being built instead.

I was also waiting on Mark to follow up on this, otherwise I can take
closer look at it.

Based on a quick look it seemed like Mark was right about missing static
keywords in a driver indirectly enabled by the "offending" commit.

Johan
