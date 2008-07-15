From: Bernhard Walle <bwalle@suse.de>
Subject: Re: today's linux-next fails to boot
Date: Tue, 15 Jul 2008 13:17:44 +0200
Message-ID: <20080715131744.0e1e20a3@halley.suse.de>
References: <4877400B.1000400@gmail.com>
	<487C074E.8080309@gmail.com>
	<s5htzer4d9p.wl%tiwai@suse.de>
	<20080715131553.61f36ca2@halley.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns1.suse.de ([195.135.220.2]:45278 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754725AbYGOLRE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Jul 2008 07:17:04 -0400
In-Reply-To: <20080715131553.61f36ca2@halley.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bernhard Walle <bwalle@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, =?UTF-8?B?RnLDqWTDqXJpYw==?= Weisbecker <fweisbec@gmail.com>, =?UTF-8?B?VMO2csO2aw==?= Edwin <edwintorok@gmail.com>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

* Bernhard Walle [2008-07-15 13:15]:
>
> * Takashi Iwai [2008-07-15 13:06]:
> > 
> > Added Bernhard to Cc.  Maybe we should defer firmware_map_add*()?
> 
> Yes. I already posted a patch for that.
> 
> http://article.gmane.org/gmane.linux.kernel.kexec/1882

Which does not defer firmware_map_add*() but the kobject
initialisation. Which also fixes the problem.


Bernhard
-- 
Bernhard Walle, SUSE LINUX Products GmbH, Architecture Development
