From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Tree for Jan 7
Date: Tue, 08 Jan 2019 00:56:49 +1100
Message-ID: <87sgy4a7vi.fsf@concordia.ellerman.id.au>
References: <20190107150609.0510def3@canb.auug.org.au> <CAMuHMdUCKaADLBrv0KLXSYHe8bR3ws7mhYr+1SkFYW15kDGo9Q@mail.gmail.com> <87va30adsg.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87va30adsg.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Michael Ellerman <mpe@ellerman.id.au> writes:

> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> Hi Stephen, Michael,
>>
>> Happy NY! Looking forward to lots of linux-next releases and build
>> logs in 2019 ;-)
>>
>> On Mon, Jan 7, 2019 at 5:08 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> Status of my local build tests will be at
>>> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
>>> advice about cross compilers/configs that work, we are always open to add
>>> more builds.
>>
>>     Proxy Error
>>     The proxy server received an invalid response from an upstream server.
>>     The proxy server could not handle the request GET /kisskb/.
>>
>>     Reason: Error reading from remote server
>>
>>     Apache/2.4.37 (Debian) Server at kisskb.ellerman.id.au Port 80
>>
>> Oops...
>
> Erk.
>
> Seems postgres is unhappy, database is corrupt.
>
> I'm restoring from a backup but it seems to be taking a long time, I may
> not get it finished tonight.

So I finally got the backup to restore.

Then I restarted everything, and as soon as the first set of new results
came in the DB appears to have wedged again.

So good times all round.

I'll try and get it fixed tomorrow.

cheers
