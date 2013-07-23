From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH linux-next] arm: zynq: fix compilation warning
Date: Tue, 23 Jul 2013 11:03:05 -0700
Message-ID: <CAOesGMgCDb=YUdNsmNw7GfnnQM0F1C2r18h0orW8Zf4-nFWT1w@mail.gmail.com>
References: <1372336962-6459-1-git-send-email-vincent.stehle@freescale.com>
 <51CC37BF.8030309@monstr.eu>
 <20130628103855.c4a89a6f1c6ef425fee34bc6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130628103855.c4a89a6f1c6ef425fee34bc6@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Simek <monstr@monstr.eu>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Vincent_Stehl=E9?= <vincent.stehle@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Robin Holt <holt@sgi.com>, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 27, 2013 at 5:38 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Thu, 27 Jun 2013 15:01:51 +0200 Michal Simek <monstr@monstr.eu> wrote:
>>
>> Arnd asked in this post
>> http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg454947.html
>> to fold his small patch to that larger one.
>>
>> Not sure why it is not there.
>> Arnd, Robin?
>
> Should have asked Andrew :-)
>
> I have added (most of) Arnd's patch to the end of the akpm tree today.

It was a dependency thing where new code was added in arm-soc, so the
sweeping patches in Andrew's tree couldn't cover them (without adding
said dependency and thus no longer apply on top of mainline).

I'll apply this and the keystone fix to the arm-soc fixes branch now
for 3.11-rc3.


-Olof
