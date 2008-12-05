From: reinette chatre <reinette.chatre@intel.com>
Subject: Re: [ipw3945-devel] next-20081125: call trace for iwlagn	(rfkill
	switch on)
Date: Thu, 04 Dec 2008 22:17:42 -0800
Message-ID: <1228457862.26014.3.camel@rc-desk>
References: <20081128063859.GB4700@denkbrett.schottelius.org>
	 <AFAB8585072C7E48BC5C6F9C87F9B7970214D75A@pdsmsx502.ccr.corp.intel.com>
	 <20081204112302.GA22532@denkbrett.schottelius.org>
	 <AFAB8585072C7E48BC5C6F9C87F9B797021DA134@pdsmsx502.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:4709 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751161AbYLEGQo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Dec 2008 01:16:44 -0500
In-Reply-To: <AFAB8585072C7E48BC5C6F9C87F9B797021DA134@pdsmsx502.ccr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luo, Ximin" <ximin.luo@intel.com>
Cc: Nico -telmich- Schottelius <nico-linux-ipw3945-devel@schottelius.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "ipw3945-devel@lists.sourceforge.net" <ipw3945-devel@lists.sourceforge.net>

On Thu, 2008-12-04 at 16:48 -0800, Luo, Ximin wrote:
> Reinette means the WARNING message can be ignored. Did you card works well for the issue? Maybe you can add new comments. Thanks for your works. :)

Yes - the warning can be ignored, the error messages surrounding it
should not be ignored though. A patch to remove the printing of the WARN
has been submitted. You can find it at
http://marc.info/?l=linux-wireless&m=122843092714449&w=2

Reinette
