Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D033A6F2;
	Fri, 17 Jul 2026 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298953; cv=none; b=jXTbOaxorCsmNb5Jr++2m1ptwqKmGMqrhVGIDoKWyqCy0VnwNQsRXf43GF1UUYKcyotXhFc2u0FihxkTQP9QNQ5Vbr2ZpJZRiUtXAb3qbLfHJM8ucE5ta8FQ4PBHI0t7uDtKbYU82yGjdLpGU7hXt2JhKko4Y43fBArtnyVqQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298953; c=relaxed/simple;
	bh=uf9MVxWOT8OnoHcfj/PtVUxgR21FkOeM6boTDOIzKWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfYRBIcHAmgLlFW6mYTSwo4tPNmqzcRws2K1eNK5zcyG9GKE6ANoFn3MOBpSgn6JMkIqghqsks99ho8YbkCBCgUXuwzfn+2P8pv9fid0vgA2PGJ6AwmrtiU0gFx58c7zCLDJk9qNMcE2Fjd5uORE63R8XkWmWkWnO5v6/BdmQ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q86nDaLQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q86nDaLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F8C1F000E9;
	Fri, 17 Jul 2026 14:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784298952;
	bh=8pOP6G8fAAAzMFgth84XHFfZlwmudgMgCirZyl1JbCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q86nDaLQuBjHqhRJsYO3Q8C1ZtPBUEPLqE6SMZYnEsPaYKYejF/BZVlG6yGk4oCmV
	 OfFFSHBnqOa8gj98dy+92eUf95PX/v4w2ziQtoOMOds4bNfoUER+ZMZvYp2s/aYEtQ
	 ixV7dN7QX7Ypz2b4aDQhlEilS4UpfEjg1yikLqE8=
Date: Fri, 17 Jul 2026 16:35:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <2026071734-papyrus-unmovable-5826@gregkh>
References: <alUk8OTfE-f9oQo8@sirena.org.uk>
 <4f9f5ff9-8eaa-4bd5-9331-37119f78e13f@sirena.org.uk>
 <c2fe4a81c639cddb65116d9b3526e82206927c0d.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2fe4a81c639cddb65116d9b3526e82206927c0d.camel@mailbox.org>

On Fri, Jul 17, 2026 at 03:47:55PM +0200, Manuel Ebner wrote:
> Hi Mark, 
> 
> On Wed, 2026-07-15 at 16:37 +0100, Mark Brown wrote:
> > On Mon, Jul 13, 2026 at 06:48:32PM +0100, Mark Brown wrote:
> > > Hi all,
> > > 
> > > In the final builds, today's linux-next build (arm64 allyesconfig)
> > > failed like this:
> > 
> > This error is due to a71f5aef1be98 (USB: gadget: fsl-udc: enable compile
> > testing) from the usb tree, a dependency change as expected.  I'll do
> > something about this tomorrow.
> 
> I stumbled across the same build errors. Are you still on this?

Should I revert that commit to resolve this?

thanks,

greg k-h
