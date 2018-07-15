From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: Signed-off-by missing for commits in the arm-soc tree
Date: Sun, 15 Jul 2018 15:50:07 -0700
Message-ID: <CAOesGMhVeo6Wc=nMcEnusa+FfwQBWJnxs0LY-zXm4HMau+SMhg@mail.gmail.com>
References: <20180716075718.4e5ef491@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180716075718.4e5ef491@canb.auug.org.au>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

Thanks Stephen, I keep saying every time you catch these that I need
to run the same script. :(

Florian, I wonder if this happened when you rebased to squash in the fix?

I'll figure out where to get this into my workflow so we catch it
before I merge from now on.


-Olof

On Sun, Jul 15, 2018 at 2:57 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commits
>
>   b8ccf02a5014 ("ARM: dts: bcm283x: Add the PMU to the devicetree.")
>   b7dd29b401f5 ("ARM: dts: bcm283x: Add Transposer block")
>   74d1e007915f ("hwmon: Add support for RPi voltage sensor")
>   70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
>   a1547e0bca51 ("firmware: raspberrypi: Remove VLA usage")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell
