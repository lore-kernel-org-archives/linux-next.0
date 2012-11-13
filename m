From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Tue, 13 Nov 2012 09:24:30 +0000
Message-ID: <50A211CE.7020808@jic23.retrosnub.co.uk>
References: <20121113165106.e592e23693663de49e9d78d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ppsw-43.csi.cam.ac.uk ([131.111.8.143]:41639 "EHLO
	ppsw-43.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753338Ab2KMJYg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Nov 2012 04:24:36 -0500
In-Reply-To: <20121113165106.e592e23693663de49e9d78d0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>

On 13/11/12 05:51, Stephen Rothwell wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> In file included from drivers/power/lp8788-charger.c:15:0:
> include/linux/iio/consumer.h:76:21: error: unknown type name 'u8'
> include/linux/iio/consumer.h:78:11: error: expected ';', ',' or ')' before 'void'
>
> Caused by commit 92d1079b281f ("staging:iio: add a callback buffer for in
> kernel push interface").  Presumably just a missing include.
>
> I have reverted that commit for today (it introduces a set of not yet
> used interfaces).
>
Oops. Missed that.  Needs

#include <linux/types.h>

Sorry about that will fix up sometime in the next few days.
