From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: next-20160225 build: 2 failures 44 warnings (next-20160225)
Date: Sat, 27 Feb 2016 15:40:28 +0100
Message-ID: <20160227154028.60f2cfca@free-electrons.com>
References: <E1aYsmb-0006qb-76@optimist>
	<20160226030949.GL18327@sirena.org.uk>
	<20160226091410.5dad4306@free-electrons.com>
	<20160226121220.GO18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160226121220.GO18327-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Mark,

On Fri, 26 Feb 2016 21:12:20 +0900, Mark Brown wrote:

> > Another solution would be to provide an implementation of
> > atomic_io_modify() on arm64, though that would need the ACK from the
> > ARM64 maintainers.
> 
> It also sounds like a more modern solution might be to use syscon for
> the shared register, but perhaps I'm missing something about how the IP
> is set up so ICBW.

I think back when we implemented this, syscon/simple-mfd was
not available or widely used - I don't really remember. We could indeed
try to switch to a syscon based solution.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
