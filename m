From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 11 Jul 2016 15:29:55 +1000
Message-ID: <20160711152955.535c88a7@canb.auug.org.au>
References: <20160711114653.066355ae@canb.auug.org.au>
	<20160711044817.GE14693@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41315 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750835AbcGKF35 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jul 2016 01:29:57 -0400
In-Reply-To: <20160711044817.GE14693@lahna.fi.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>

Hi Mika,

On Mon, 11 Jul 2016 07:48:17 +0300 Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
>
> Looks like it is the module name (configfs.o) that confuses modpost or
> linker. The below patch fixes it for me.

That makes sense.  Thanks.

-- 
Cheers,
Stephen Rothwell
