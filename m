From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the final tree
 (devicetree tree related)
Date: Mon, 16 Apr 2012 21:39:30 -0600
Message-ID: <CACxGe6ugOsCNRD2Jqyv-gf8X4Dvd012Gn5RyBq4TQBBb86W1qg@mail.gmail.com>
References: <20120411151155.b1a614f174442a592d1c1561@canb.auug.org.au>
 <20120412103157.70669ff82b81d5d926c36d4d@canb.auug.org.au>
 <CACxGe6tDa+AzK0O=E+EPZ90Ek_C-rM-G4fHSnsdL0S+fNcmzmw@mail.gmail.com> <20120417132357.b38685ea31582e638623961c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120417132357.b38685ea31582e638623961c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 16, 2012 at 9:23 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> On Wed, 11 Apr 2012 18:35:34 -0600 Grant Likely <grant.likely@secretl=
ab.ca> wrote:
>>
>> On Wed, Apr 11, 2012 at 6:31 PM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>> > Hi Grant,
>> >
>> > On Wed, 11 Apr 2012 15:11:55 +1000 Stephen Rothwell <sfr@canb.auug=
=2Eorg.au> wrote:
>> >>
>> >> After merging the final tree, today's linux-next build (sparc64 d=
efconfig)
>> >> failed like this:
>> >>
>> >> drivers/of/of_mdio.c: In function 'of_mdiobus_register':
>> >> drivers/of/of_mdio.c:75:4: error: implicit declaration of functio=
n 'irq_of_parse_and_map' [-Werror=3Dimplicit-function-declaration]
>> >>
>> >> Caused by commit e46c11b94787 ("of/irq: add empty irq_of_parse_an=
d_map()
>> >> for non-dt builds"). =A0SPARC has CONFIG_OF but not CONFIG_OF_IRQ=
 ...
>> >>
>> >> I have reverted that commit for today.
>> >
>> > That commit is actually in the devicetree-current tree.
>>
>> Yes, drop that tree or revert that commit. =A0There's nothing else i=
n
>> there and I didn't have time to pull it back today before you starte=
d
>> linux-next for the day. =A0The change is bogus and I'll spin a prope=
r
>> fixup for tomorrow.
>
> Ping?

Haven't got it done yet.  It's still safe to ignore that tree.

g.
