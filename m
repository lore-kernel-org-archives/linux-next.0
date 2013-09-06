From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: linux-next: problem fetching the watchdog tree
Date: Fri, 6 Sep 2013 08:40:30 +0200
Message-ID: <20130906064029.GB28275@spo001.leaseweb.com>
References: <20130906090550.1b995b91877609b9361f99ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130906090550.1b995b91877609b9361f99ae@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> Fetching the wireless tree yesterday and today produced this error:
> 
> fatal: unable to connect to www.linux-watchdog.org:
> www.linux-watchdog.org[0: 83.149.101.17]: errno=Connection refused

Strange. I had a git zombie process, got rid of it i2 days ago and
restarted git but apparently it didn't do anything anymore.
I just restarted it and saw a pull coming in again. So it is fixed now.

Thanks for pointing it out.
Wim.
