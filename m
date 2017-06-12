From: Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v1 2/2] selftests: kselftest_harness: Fix compile warning
Date: Mon, 12 Jun 2017 14:31:20 -0600
Message-ID: <cc8ca030-be45-e65c-c84a-62f8ab50b476@kernel.org>
References: <20170611123258.19624-1-mic@digikod.net>
 <20170611123258.19624-3-mic@digikod.net>
 <CAGXu5jJEQ_sg_5Y1gzhnQd3qW+LdKwqNRAAznZwYwNd8JVj5-A@mail.gmail.com>
Reply-To: shuah@kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jJEQ_sg_5Y1gzhnQd3qW+LdKwqNRAAznZwYwNd8JVj5-A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, linux-kselftest@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>, Shuah Khan <shuah@kernel.org>
List-Id: linux-next.vger.kernel.org

On 06/11/2017 08:22 PM, Kees Cook wrote:
> On Sun, Jun 11, 2017 at 5:32 AM, Mickaël Salaün <mic@digikod.net> wrote:
>> Do not confuse the compiler with a semicolon preceding a block. Replace
>> the semicolon with an empty block to avoid a warning:
>>
>>   gcc -Wl,-no-as-needed -Wall -lpthread seccomp_bpf.c -o /.../linux/tools/testing/selftests/seccomp/seccomp_bpf
>>   In file included from seccomp_bpf.c:40:0:
>>   seccomp_bpf.c: In function ‘change_syscall’:
>>   ../kselftest_harness.h:558:2: warning: this ‘for’ clause does not guard... [-Wmisleading-indentation]
>>     for (; _metadata->trigger;  _metadata->trigger = __bail(_assert))
>>     ^
>>   ../kselftest_harness.h:574:14: note: in expansion of macro ‘OPTIONAL_HANDLER’
>>    } while (0); OPTIONAL_HANDLER(_assert)
>>                 ^~~~~~~~~~~~~~~~
>>   ../kselftest_harness.h:440:2: note: in expansion of macro ‘__EXPECT’
>>     __EXPECT(expected, seen, ==, 0)
>>     ^~~~~~~~
>>   seccomp_bpf.c:1313:2: note: in expansion of macro ‘EXPECT_EQ’
>>     EXPECT_EQ(0, ret);
>>     ^~~~~~~~~
>>   seccomp_bpf.c:1317:2: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the ‘for’
>>     {
>>     ^
>>
>> Signed-off-by: Mickaël Salaün <mic@digikod.net>
>> Cc: Andy Lutomirski <luto@amacapital.net>
>> Cc: Kees Cook <keescook@chromium.org>
>> Cc: Shuah Khan <shuahkh@osg.samsung.com>
>> Cc: Will Drewry <wad@chromium.org>
> 
> Eek, thanks for catching that. :)
> 
> Acked-by: Kees Cook <keescook@chromium.org>
> 
> -Kees

Thanks. Ths fix is now in linux-kselftest next.

-- Shuah
