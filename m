From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 0/3] Add support for the M5150 processor
Date: Mon, 10 Mar 2014 20:21:07 +0100
Message-ID: <CAOiHx=mNtTv01CyjC=rXKzTeF79sbBqnZBQWbWXAkKnrGeZrng@mail.gmail.com>
References: <1393940084-29518-1-git-send-email-markos.chandras@imgtec.com> <CAP=VYLribDoh9LyQuNr-RxmRdaVxqNqzCCSAgMxKoZKWd2b1YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <CAP=VYLribDoh9LyQuNr-RxmRdaVxqNqzCCSAgMxKoZKWd2b1YA@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 10, 2014 at 6:43 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On Tue, Mar 4, 2014 at 8:34 AM, Markos Chandras
> <markos.chandras@imgtec.com> wrote:
>> Hi,
>>
>> This patchset adds support for the recently announced M5150 processor
>> http://imgtec.com/mips/mips-series5-mclass-m51xx.asp?NewsID=804
>
> I'm going to skip the bisect, and make a guess that this patchset causes
> the following build failures on all pre-existing mips boards:
>
> arch/mips/kernel/cpu-probe.c:856:7: error: 'PRID_IMP_M5150' undeclared
> (first use in this function)
> arch/mips/kernel/cpu-probe.c:857:16: error: 'CPU_M5150' undeclared
> (first use in this function)
> make[3]: *** [arch/mips/kernel/cpu-probe.o] Error 1
>
> See this link as one of the many linux-next mips failures:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/10701712/


Looking at mips-next and patchwork, the problem isn't the patchset
itself, but rather that only the third patch was applied.

Ralf, I think you missed the following two patches :)

http://patchwork.linux-mips.org/patch/6595/
http://patchwork.linux-mips.org/patch/6596/


Regards
Jonas
