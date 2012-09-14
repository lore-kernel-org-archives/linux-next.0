From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Fri, 14 Sep 2012 09:55:02 +0200
Message-ID: <20120914075502.GC3647@sortiz-mobl>
References: <20120912160719.4377f041ac76ddfa13be7df1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:64469 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756440Ab2INHzG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Sep 2012 03:55:06 -0400
Content-Disposition: inline
In-Reply-To: <20120912160719.4377f041ac76ddfa13be7df1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, srinivas pandruvada <srinivas.pandruvada@intel.com>, Jiri Kosina <jkosina@suse.cz>, Jonathan Cameron <jic23@kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hi Stephen,

On Wed, Sep 12, 2012 at 04:07:19PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/hid/hid-sensor-hub.c: In function 'sensor_hub_probe':
> drivers/hid/hid-sensor-hub.c:599:3: error: too few arguments to function 'mfd_add_devices'
> 
> Caused by commit 401ca24fb34a ("HID: sensors: introduce sensor
> framework") interacting with commit 6607bad3d763 ("mfd: core: Push
> irqdomain mapping out into devices") from the mfd tree.
> 
> I have added the following merge fix patch and can carry it as necessary
> (no action is required).
Thanks for fixing this one.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
