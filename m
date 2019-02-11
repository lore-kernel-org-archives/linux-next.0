From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Re: linux-next: Fixes tag needs some work in the fbdev tree
Date: Mon, 11 Feb 2019 10:10:33 +0100
Message-ID: <4cf3fb95-e7d6-8813-c6f6-2075ca50e18c@ysoft.com>
References: <20190211072443.1cbedb29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211072443.1cbedb29@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 10. 02. 19 21:24, Stephen Rothwell wrote:
> Hi Bartlomiej,
> 
> In commit
> 
>    7d7e58d30e04 ("dt-bindings: display: ssd1307fb: Remove reset-active-low from examples")
> 
> Fixes tag
> 
>    Fixes: 519b4db ("fbdev: ssd1307fb: Remove reset-active-low from the DT binding document")
> 
> has these problem(s):
> 
>    - SHA1 should be at least 12 digits long
>      Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>      or later) just making sure it is not set (or set to "auto").

Hi Stephen,

Sorry, that is my fault, I put the Fixes tag into the submitted patch.
Thanks for the git configuration hint. All my machines were configured
correctly except the one I generated the Fixes tag on, ups :(

Normally checkpatch.pl does a good job identifying errors in referenced
commits. Unfortunately it did not complain in this case. Would be nice
to add this check. I skimmed through the appropriate part of the script
but I do not feel like adding this feature myself, Perl is not my domain.

Sorry for the inconvenience.
Michal
