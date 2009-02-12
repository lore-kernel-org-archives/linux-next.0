From: reinette chatre <reinette.chatre@intel.com>
Subject: Re: [ipw3945-devel] X200: Resume and iwlwifi on
	2.6.29-rc4-ikn-00001-gd5b5623
Date: Thu, 12 Feb 2009 11:48:40 -0800
Message-ID: <1234468120.30608.30.camel@rc-desk>
References: <20090209093507.GA27678@denkbrett.schottelius.org>
	 <20090210070147.GA4684@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760186AbZBLTpB@vger.kernel.org>
In-Reply-To: <20090210070147.GA4684@denkbrett.schottelius.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nico Schottelius <nico-linux-20090209@schottelius.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "ipw3945-devel@lists.sourceforge.net" <ipw3945-devel@lists.sourceforge.net>
List-Id: linux-next.vger.kernel.org

On Mon, 2009-02-09 at 23:01 -0800, Nico Schottelius wrote:
> Good morning!
> 
> Summary on the X200:
> - First resume after suspend takes 20 seconds
> - Further resumes work fine
> - wlan works *before* first suspend and wakeup
> - after that the same happens as on 2.6.29-rc3-ikn-00697-gae1a25d:
>   the device refuses to come up with the message
>   "iwlagn: Could not load the INST uCode section" and
>   "iwlagn: Unable to set up bootstrap uCode: -110"

Sorry that I missed responding to your email in all the messages
regarding this problem. A patch was recently sent to address it - could
you please try with
http://marc.info/?l=linux-wireless&m=123429595818495&w=2 ?

Thanks

Reinette
