From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the arm-soc tree
Date: Mon, 16 Jul 2018 02:54:01 -0700
Message-ID: <311493fa-18de-cfe2-30b1-6e018e434b44@gmail.com>
References: <20180716075718.4e5ef491@canb.auug.org.au>
 <CAOesGMhVeo6Wc=nMcEnusa+FfwQBWJnxs0LY-zXm4HMau+SMhg@mail.gmail.com>
 <6a9fa6f3-7aef-a83b-72a6-dc9492964b5e@gmail.com>
 <CAGb2v667K4Z6o-KEQROWuCbgJbKLNX_OCpCBOWaECb_qfRMBpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v667K4Z6o-KEQROWuCbgJbKLNX_OCpCBOWaECb_qfRMBpw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Olof Johansson <olof@lixom.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Eric Anholt <eric@anholt.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 07/16/2018 02:24 AM, Chen-Yu Tsai wrote:
> On Mon, Jul 16, 2018 at 5:13 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>>
>> On 07/15/2018 03:50 PM, Olof Johansson wrote:
>>> Thanks Stephen, I keep saying every time you catch these that I need
>>> to run the same script. :(
>>>
>>> Florian, I wonder if this happened when you rebased to squash in the fix?
>>
>> Humm, could be, all I did (and it was not the first time) was to do an
>> interactive rebase with --preserve-merges. AFAICT, all of these commits
>> came from Eric's pull request, so what I typically do is just sign off
>> on the merge commit, but do not apply my SoB to all commits coming from
>> that pull request if that makes sense?
> 
> When you rebase, if the commit is re-applied, the committer changes to
> you, so you need to add your SoB to all commits you rebased.

Indeed, thanks for bringing that up Chen-Yu.

> 
> I suppose you could override it with GIT_COMMITTER_NAME and
> GIT_COMMITTER_EMAIL environment variables, but that sort of distorts
> the SoB if any changes were added due to rebasing, such as resolution
> of merge conflicts.
> 
> ChenYu
> 

-- 
Florian
