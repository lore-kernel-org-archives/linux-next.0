From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Subject: Re: linux-next: Tree for Sep 28 (drivers/gpu/drm/amd/amdgpu/amdgpu.ko)
Date: Thu, 29 Sep 2016 09:27:44 +0200
Message-ID: <2d4dc1e5-5dac-8be0-8ad3-05cdc33a7b2c@vodafone.de>
References: <20160928165618.56208c39@canb.auug.org.au>
 <f5495e73-ea11-cab0-5d0a-df4567a086b6@infradead.org>
 <MWHPR12MB1694FDEF1A23DC7231AD5834F7CF0@MWHPR12MB1694.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1293740952=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <MWHPR12MB1694FDEF1A23DC7231AD5834F7CF0@MWHPR12MB1694.namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 'Randy Dunlap' <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.
--===============1293740952==
Content-Type: multipart/alternative;
 boundary="------------C52CBB7D698394358B7D69DD"

This is a multi-part message in MIME format.
--------------C52CBB7D698394358B7D69DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 28.09.2016 um 22:46 schrieb Deucher, Alexander:
>> -----Original Message-----
>> From: Randy Dunlap [mailto:rdunlap@infradead.org]
>> Sent: Wednesday, September 28, 2016 1:10 PM
>> To: Stephen Rothwell; linux-next@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; dri-devel; Deucher, Alexander; Koenig,
>> Christian
>> Subject: Re: linux-next: Tree for Sep 28
>> (drivers/gpu/drm/amd/amdgpu/amdgpu.ko)
>>
>> On 09/27/16 23:56, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20160927:
>>>
>> on i386:
>>
>> ERROR: "amd_set_clockgating_by_smu"
>> [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>
> DRM_AMD_POWERPLAY needs to be set.  Fixed in the attached patch.

Patch is Reviewed-by: Christian König <christian.koenig@amd.com>.

>
> Alex
>
>> Full randconfig file is attached.
>>
>> --
>> ~Randy
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--------------C52CBB7D698394358B7D69DD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Am 28.09.2016 um 22:46 schrieb Deucher,
      Alexander:<br>
    </div>
    <blockquote
cite="mid:MWHPR12MB1694FDEF1A23DC7231AD5834F7CF0@MWHPR12MB1694.namprd12.prod.outlook.com"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">-----Original Message-----
From: Randy Dunlap [<a class="moz-txt-link-freetext" href="mailto:rdunlap@infradead.org">mailto:rdunlap@infradead.org</a>]
Sent: Wednesday, September 28, 2016 1:10 PM
To: Stephen Rothwell; <a class="moz-txt-link-abbreviated" href="mailto:linux-next@vger.kernel.org">linux-next@vger.kernel.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>; dri-devel; Deucher, Alexander; Koenig,
Christian
Subject: Re: linux-next: Tree for Sep 28
(drivers/gpu/drm/amd/amdgpu/amdgpu.ko)

On 09/27/16 23:56, Stephen Rothwell wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Hi all,

Changes since 20160927:

</pre>
        </blockquote>
        <pre wrap="">
on i386:

ERROR: "amd_set_clockgating_by_smu"
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

</pre>
      </blockquote>
      <pre wrap="">
DRM_AMD_POWERPLAY needs to be set.  Fixed in the attached patch.</pre>
    </blockquote>
    <br>
    Patch is Reviewed-by: Christian König
    <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>.<br>
    <br>
    <blockquote
cite="mid:MWHPR12MB1694FDEF1A23DC7231AD5834F7CF0@MWHPR12MB1694.namprd12.prod.outlook.com"
      type="cite">
      <pre wrap="">

Alex

</pre>
      <blockquote type="cite">
        <pre wrap="">
Full randconfig file is attached.

--
~Randy
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <br>
        <pre wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------C52CBB7D698394358B7D69DD--

--===============1293740952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1293740952==--
