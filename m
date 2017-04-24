From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: linux-next: manual merge of the pm tree with the arm-soc tree
Date: Mon, 24 Apr 2017 11:22:34 -0700
Message-ID: <9d60286d-86ae-93a0-04ce-0037d1105bba@oracle.com>
References: <20170421105405.6a690b35@canb.auug.org.au>
 <CAK8P3a3kHO1NZFJXvDwWO625aEmXoo2540FRKe+YYzoYE9NCSg@mail.gmail.com>
 <4b58d5ab-c924-97af-728f-b9f524e62a53@oracle.com>
 <CAK8P3a0cVMt3y_oYH70V-ekPvUMeeBApSvybpRftSupzYy1FWQ@mail.gmail.com>
 <e2f9efab-291f-1436-2176-0fff3f2aae3f@oracle.com>
 <CAK8P3a1mPgM4XmS398DPsSbyCyD=12xQfUrF_HRqyd52_21o7Q@mail.gmail.com>
 <c3dfaceb-41ba-b13d-f47e-a279c3e2f6b9@oracle.com>
 <c97828b4-7f19-93d1-6f23-d86e089cea87@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c97828b4-7f19-93d1-6f23-d86e089cea87@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Gerlach <d-gerlach@ti.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Nishanth Menon <nm@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On 4/24/2017 11:02 AM, Dave Gerlach wrote:
> On 04/21/2017 04:54 PM, Santosh Shilimkar wrote:
>> +Dave,
>>

[...]

>>> Ok, good, thanks for checking! They are however the commits that
>>> contain the silly https://urldefense.proofpoint.com URLs. Can you
>>> send a follow-up patch to fix these and use the regular
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__www.ti.org&d=DwIBaQ&c=RoP1YumCXCgaWHvlZYR8PQcxBKCX5YTpkKY057SbK10&r=XBn1JQGPwR8CsE7xpP3wPlG6DQU7qw8ym65xieNZ4hY&m=vFHOEb7p2FxbH00YRQq4WnRiu2BKHADn0gl6e6DoNFQ&s=7mfiIp2Ywy9_ppWKjEGlrswiKRndv8_I7zGVF9uyT0w&e=
>>>
>>>
>>> URL that is in linux-next?
>>>
>> Dave,
>> Any reason you changed these URLs in last version ?
>> Can you please fixup these URLs to along with DT defines.
>
> I didn't change any of the URLs in the patches, I am not sure what those
> URLs are. In the patches I sent the URLs are fine, and I see them normal
> on patchwork too:
> https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.kernel.org_patch_9660785_&d=DwICaQ&c=RoP1YumCXCgaWHvlZYR8PQcxBKCX5YTpkKY057SbK10&r=XBn1JQGPwR8CsE7xpP3wPlG6DQU7qw8ym65xieNZ4hY&m=eK4-xq3xbWwYHfuVa6ee48pvTCWUv5X5PHM285eHMLQ&s=uCfKZ0Z0T8Aaf4ircFilcu8zRVDU8XyGdbsq4OW3GaE&e=
>
> Is there something that automatically changes those? I don't want to
> send another patch for it to just get mangled again.
>
Looks like thats the case as one of my Oracle colleague pointed out.
I will send you off-list an email to get correct URL and update the git 
tree accordingly.

Regards,
Santosh
