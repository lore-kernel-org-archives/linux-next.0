From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the battery tree
Date: Wed, 28 Mar 2012 12:38:08 +0100
Message-ID: <20120328113808.GB23005@sirena.org.uk>
References: <20120315135609.2f9a2a030866c476dc736b9c@canb.auug.org.au>
 <20120326161132.GA6430@lizard>
 <20120327084414.dacbf074e0f4ddd65ff3ecfb@canb.auug.org.au>
 <20120327130350.GB7972@lizard>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:34423 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932285Ab2C1LiM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Mar 2012 07:38:12 -0400
Content-Disposition: inline
In-Reply-To: <20120327130350.GB7972@lizard>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Murthy <arun.murthy@stericsson.com>, Linus Walleij <linus.walleij@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>

On Tue, Mar 27, 2012 at 05:03:50PM +0400, Anton Vorontsov wrote:

> But for such drivers I usually give my 'Acked-by' so that
> patches could be merged via single tree (i.e. mfd). But nobody
> asked me in this case.

Well, for completely new MFDs there's no need as the dependency on the
core will generally sort everything out.  It's only adding things to an
existing MFD that might have some issues.
