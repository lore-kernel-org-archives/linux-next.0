From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubi tree build failure
Date: Wed, 03 Jun 2009 16:07:16 +0300
Message-ID: <4A267584.3030805@nokia.com>
References: <20090603184408.49c7fb1f.sfr@canb.auug.org.au>	 <4A265DF6.3070602@nokia.com>  <4A2672A8.8020809@nokia.com> <1244034343.4074.2.camel@hp.diimka.lan>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757364AbZFCNHy@vger.kernel.org>
In-Reply-To: <1244034343.4074.2.camel@hp.diimka.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "dpervushin@embeddedalley.com" <dpervushin@embeddedalley.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

dmitry pervushin wrote:
> On Wed, 2009-06-03 at 15:55 +0300, Artem Bityutskiy wrote:
>> Did not see compile error on x86 as well. Anyway, I have added more
>> includes which seem to be missed. Hopefully this problem is fixed
>> now. Thanks!
> however it builds ok on arm too, adding #include <linux/err.h> should
> fix this..

Yeah, just did this. Added also linux/mutex.h which we also missed.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
