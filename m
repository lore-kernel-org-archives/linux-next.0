From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v3] PM / QoS: Introduce new classes: DMA-Throughput and DVFS-Latency
Date: Fri, 9 Mar 2012 14:53:43 +0900
Message-ID: <CAJ0PZbTfw1U8raiwiNX14x+jnaWa7ptAgpaaTJgCCZKZU24TDg@mail.gmail.com>
References: <13197479.540821330911965933.JavaMail.weblogic@epv6ml06>
	<1331096521-26026-1-git-send-email-myungjoo.ham@samsung.com>
	<20120308034722.GA10286@envy17>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120308034722.GA10286@envy17>
Sender: linux-kernel-owner@vger.kernel.org
To: markgross@thegnar.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <mavej@redhat.com>, linux-pm@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Kevin Hilman <khilman@ti.com>, Jean Pihet <j-pihet@ti.com>, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Mar 8, 2012 at 12:47 PM, mark gross <markgross@thegnar.org> wro=
te:
> On Wed, Mar 07, 2012 at 02:02:01PM +0900, MyungJoo Ham wrote:
>> 1. CPU_DMA_THROUGHPUT
=2E..
>> 2. DVFS_LATENCY
>
> The cpu_dma_throughput looks ok to me. =A0I do however; wonder about =
the
> dvfs_lat_pm_qos. =A0Should that knob be exposed to user mode? =A0Does=
 that
> matter so much? =A0why can't dvfs_lat use the cpu_dma_lat?
>
> BTW I'll be out of town for the next 10 days and probably will not ge=
t
> to this email account until I get home.
>
> --mark
>

1. Should DVFS Latency be exposed to user mode?

It would depend on the policy of the given system; however, yes, there
are systems that require a user interface for DVFS Latency.
With the example of user input response (response to user click,
typing, touching, and etc), a user program (probably platform s/w or
middleware) may input QoS requests. Besides, when a new "application"
is starting, such "middleware" may want faster responses from DVFS
mechanisms.


2. Does DVFS Latency matter?

Yes, in our experimental sets w/ Exynos4210 (those slapped in Galaxy
S2 equivalent; not exactly as I'm not conducted in Android systems,
but Tizen), we could see noticable difference w/ bare eyes for
user-input responses. When we shortened DVFS polling interval with
touches, the touch responses were greatly improved; e.g., losing 10
frames into losing 0 or 1 frame for a sudden input rush.

3. Why not replace DVFS Latency w/ CPU-DMA-Latency/Throughput?

When we implement the user-input response enhancement with CPU-DMA QoS
requests, the PM-QoS will unconditionally increase CPU and BUS
frequencies/voltages with user inputs. However, with many cases it is
unnecessary; i.e., a user input means that there will be unexpected
changes soon; however, the change does not mean that the load will
increase. Thus, allowing DVFS mechanism to evolve faster was enough to
shorten the response time and not to increase frequencies and voltages
when not needed. There were significant difference in power
consumption with this changes if the user inputs were not involving
drastic graphics jobs; e.g., typing a text message.



Cheers!
MyungJoo.

--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
